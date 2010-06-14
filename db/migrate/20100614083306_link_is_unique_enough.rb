class LinkIsUniqueEnough < ActiveRecord::Migration
  def self.up
    remove_column :timeline_events, :hash
  end

  def self.down
  end
end
