class CreateTimelines < ActiveRecord::Migration
  def self.up
    create_table :timelines do |t|
      t.string :title
      t.string :source
      t.text :template

      t.timestamps
    end
  end

  def self.down
    drop_table :timelines
  end
end
