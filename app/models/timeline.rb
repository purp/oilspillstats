class Timeline < ActiveRecord::Base
  has_one :source
  has_many :timeline_events, :through => :source, :order => 'start ASC'
  
  def start_time
    timeline_events.first.start
  end
  
  def end_time
    timeline_events.last.start
  end
  
  def duration(interval = 1.day)
    ((end_time - start_time) / interval)
  end
  
  def to_json
    timeline_events.map {|event| event.to_hash}.to_json
  end
end
