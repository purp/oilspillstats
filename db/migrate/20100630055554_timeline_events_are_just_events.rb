class TimelineEventsAreJustEvents < ActiveRecord::Migration
  class Event < ActiveRecord::Base; end
  class Event < ActiveRecord::Base; end
  
  def self.up
    rename_table :events, :events
  end

  def self.down
    rename_table :events, :events
  end
end
