class Event < ActiveRecord::Base
  belongs_to :source
  
  validates_presence_of :link
  validates_uniqueness_of :link
  
  TIMELINE_ATTRS = %w(link title description start end icon)
  
  def to_hash
    attributes.reject {|k,v| !TIMELINE_ATTRS.include?(k) || v.nil?}
  end
  
  def get_info_from_link
    doc = Nokogiri::HTML(open(link))
    start = Time.parse(doc.at('//div[@id="postDateBar"]').text)
    doc.search('//div[@id="content"]/p').each do |para|
      description << para.text
    end
  end
end
