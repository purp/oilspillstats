# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100702203010) do

  create_table "events", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "link"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "sources", :force => true do |t|
    t.string   "url"
    t.integer  "timeline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chronological_order"
    t.string   "name"
  end

  create_table "timelines", :force => true do |t|
    t.string   "title"
    t.text     "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
