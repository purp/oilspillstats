class IHateAllCapsTitles < ActiveRecord::Migration
  def self.up
    Event.find_each do |event| 
      if event.title.upcase == event.title
        event.title = event.title.titlecase
        event.save!
      end
    end
  end

  def self.down
  end
end
