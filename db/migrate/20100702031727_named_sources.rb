class NamedSources < ActiveRecord::Migration
  def self.up
    add_column :sources, :name, :string
  end

  def self.down
    remove_column :sources, :name
  end
end
