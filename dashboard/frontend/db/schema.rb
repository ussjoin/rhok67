# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111203223104) do

  create_table "buildings", :force => true do |t|
    t.string  "name"
    t.integer "facility_id"
  end

  create_table "companies", :force => true do |t|
    t.string "name"
    t.string "account"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
  end

  create_table "controllers", :force => true do |t|
    t.string  "name"
    t.string  "serial"
    t.integer "system_id"
  end

  create_table "facilities", :force => true do |t|
    t.string  "name"
    t.integer "company_id"
  end

  create_table "hardware_types", :force => true do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "inputs", :force => true do |t|
    t.integer  "sensor_id"
    t.float    "value"
    t.datetime "when"
  end

  add_index "inputs", ["when"], :name => "index_inputs_on_when"

  create_table "sensors", :force => true do |t|
    t.string  "name"
    t.integer "controller_id"
    t.integer "hardware_type_id"
    t.integer "unit_type_id"
  end

  create_table "system_types", :force => true do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "systems", :force => true do |t|
    t.string  "name"
    t.integer "building_id"
    t.integer "system_type_id"
  end

  create_table "unit_types", :force => true do |t|
    t.string "name"
    t.string "icon"
  end

end
