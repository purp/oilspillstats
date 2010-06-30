class Timeline < ActiveRecord::Base
  has_one :source
  has_many :events, :through => :source, :order => 'start ASC'
  
  def start_time
    events.first.start
  end
  
  def end_time
    events.last.start
  end
  
  def duration(interval = 1.day)
    ((end_time - start_time) / interval)
  end
  
  def to_json
    events.map {|event| event.to_hash}.to_json
  end
end
