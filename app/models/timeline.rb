class Timeline < ActiveRecord::Base
  has_one :source
  has_many :timeline_events, :through => :source
  
  def to_json
    source.refresh!
    timeline_events.map {|event| event.to_hash}.to_json
  end
end
