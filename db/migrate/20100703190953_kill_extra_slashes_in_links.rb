class KillExtraSlashesInLinks < ActiveRecord::Migration
  def self.up
    Event.find_each do |event|
      event.update_attribute(:link, event.link.gsub(/([^:])\/\//,'\1/'))
    end
    
    Source.find_each do |source|
      source.update_attribute(:link, source.link.gsub(/([^:])\/\//,'\1/'))
    end
  end

  def self.down
  end
end
