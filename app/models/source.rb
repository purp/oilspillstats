class Source < ActiveRecord::Base
  belongs_to :timeline
  has_many :events

  validates_presence_of :timeline_id, :link, :chronological_order

  def after_initialize
    @source_page_info ||= {link => nil}
    chronological_order ||= 'reverse'
  end

  def base_url
    link.match(/^(.*:\/\/[^\/]+\/)/).to_s.chomp('/')
  end

  def top_page
    source_page(link)
  end

  def source_page(src_url)
    @source_page_info[src_url] ||= Nokogiri::HTML(open(src_url))
  end

  def source_page_urls
    @source_page_info.keys
  end

  def source_pages
    ### FIXME: load pages as needed; maybe child class of Source?
    source_page_urls.map {|src_url| source_page(src_url)}
  end

  def reverse_chronological?
    chronological_order == 'reverse'
  end

  def forward_chronological?
    chronological_order == 'forward'
  end

  def get_source_urls_from_top_page
    max_page = top_page.search('//div[@class="pager"]/a')[-2].text.to_i
    (1..max_page - 1).each do |page_num|
      src_url = link + "?offset=#{page_num * 10}"
      @source_page_info[src_url] ||= nil
    end
  end

  def create_new_events_from_page(page)
    page.search('//ul[@id="documentList"]/li').each do |node|
      event_url = base_url + node.at('./a')[:href]
      event = Event.find_or_initialize_by_link(event_url)
      next unless event.new_record?

      begin
        event.source = self
        event.title = node.at('./a').text
        event.title = event.title.titlecase if event.title.upcase == event.title
        event.description = ''
        event.start = Date.parse(node.at('./span[@class="postDate"]').text).strftime("%Y-%m-%dT00:00:00-05:00")

        event.icon = base_url + node.at("./div[@class='extraInfo']/img")[:src] if node.at("./div[@class='extraInfo']/img")
        event.refresh!
      rescue Exception => e
        Rails.logger.fatal "Broke while working on #{event_url}: #{e.inspect} #{event.inspect}"
      end
    end
  end

  def refresh!
    # Change updated_at first to avoid race condition where many pageviews 
    # result in many full scans of source site
    update_attribute(:updated_at, Time.now)
    get_source_urls_from_top_page
    source_pages.each {|page| create_new_events_from_page(page)}
  end
end
