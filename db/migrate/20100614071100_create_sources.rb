class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :url
      t.integer :timeline_id

      t.timestamps
    end
    
    Timeline.find_each(:conditions => 'source is not null') do |tl|
      Source.create!(:timeline_id => tl, :url => tl.source)
    end
    
    remove_column :timelines, :source
  end

  def self.down
    add_column :timelines, :source, :string
    
    Source.find_each(:conditions => 'timeline_id > 0', :order => 'created_at DESC') do |src|
      src.timeline.update_attribute(:source, src.url)
    end

    drop_table :sources
  end
end
