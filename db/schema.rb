# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140621012916) do

  create_table "applications", force: true do |t|
    t.string   "name"
    t.string   "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", force: true do |t|
    t.string   "asset_number"
    t.string   "sn"
    t.string   "ip"
    t.string   "idrac_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "machine_cabinet_id"
    t.integer  "model_id"
    t.integer  "sa_id"
    t.integer  "switch_id"
    t.string   "switch_port"
    t.string   "hardware_info"
    t.string   "mac_addr"
    t.string   "expired_at"
    t.integer  "location_id",        default: 1
  end

  create_table "computers_projects", force: true do |t|
    t.integer "computer_id"
    t.integer "project_id"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machine_cabinets", force: true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.integer  "machine_cabinet_id"
    t.integer  "model_id"
    t.integer  "sa_id"
    t.integer  "switch_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "switches", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
