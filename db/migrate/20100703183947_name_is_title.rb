class NameIsTitle < ActiveRecord::Migration
  def self.up
    rename_column :sources, :name, :title
  end

  def self.down
    rename_column :sources, :title, :name
  end
end
