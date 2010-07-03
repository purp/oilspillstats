class UrlIsLink < ActiveRecord::Migration
  def self.up
    rename_column :sources, :url, :link
  end

  def self.down
    rename_column :sources, :link, :url
  end
end
