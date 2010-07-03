class Event < ActiveRecord::Base
  belongs_to :source

  validates_presence_of :link
  validates_uniqueness_of :link

  TIMELINE_ATTRS = %w(link title description start end icon)

  def to_hash
    attributes.reject {|k,v| !TIMELINE_ATTRS.include?(k) || v.nil?}
  end

  def to_nokogiri
    Nokogiri::HTML(open(link))
  end

  def refresh!
    if icon.blank? # icon means its a PDF
      doc = to_nokogiri
      
      self.start = Time.parse(doc.at('//div[@id="postDateBar"]').text)
      self.end = nil
      self.icon = nil
      self.image = nil
      if title && title.match(/ongoing administration-wide response/i)
        paras = doc.search("//div[@id='content']/p/b/..").map(&:text)
        first_item = paras.find_index {|para| para.match(/past 24 hours/i)} + 1
        last_item = paras.find_index {|para| para.match(/by the numbers/i)} - 1
        self.description = ['<ul>', paras[first_item..last_item].map{|para| "<li>#{para}</li>"}, "</ul>"].flatten.join("\n")
      else
        paras = doc.search('//div[@id="content"]/p')
        self.description = paras.map(&:text).join(' ').truncate(160)
      end
    end
    save!
  end
end
