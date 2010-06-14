class SourcesAreDirectional < ActiveRecord::Migration
  def self.up
    add_column :sources, :chronological_order, :integer
  end

  def self.down
    remove_column :sources, :chronological_order
  end
end
