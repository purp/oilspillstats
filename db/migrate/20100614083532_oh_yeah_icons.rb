class OhYeahIcons < ActiveRecord::Migration
  def self.up
    add_column :timeline_events, :icon, :string
  end

  def self.down
    remove_column :timeline_events, :icon
  end
end
