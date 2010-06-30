class Event < ActiveRecord::Base
  belongs_to :source
  
  validates_presence_of :link
  validates_uniqueness_of :link
  
  TIMELINE_ATTRS = %w(link title description start end icon)
  
  def to_hash
    attributes.reject {|k,v| !TIMELINE_ATTRS.include?(k) || v.nil?}
  end
end
