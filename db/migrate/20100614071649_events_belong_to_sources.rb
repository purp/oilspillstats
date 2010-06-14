class EventsBelongToSources < ActiveRecord::Migration
  def self.up
    rename_column :timeline_events, :timeline_id, :source_id
  end

  def self.down
    rename_column :timeline_events, :source_id, :timeline_id
  end
end
