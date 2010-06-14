class CreateTimelineEvents < ActiveRecord::Migration
  def self.up
    create_table :timeline_events do |t|
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :description
      t.string :image
      t.string :link
      t.string :hash
      t.integer :timeline_id

      t.timestamps
    end
  end

  def self.down
    drop_table :timeline_events
  end
end
