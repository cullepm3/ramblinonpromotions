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

ActiveRecord::Schema.define(version: 20150912213603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "years"
    t.integer  "wins"
    t.integer  "draft"
    t.integer  "champ"
    t.integer  "pts_champ"
    t.integer  "low_seed"
    t.integer  "goat"
    t.decimal  "total"
    t.string   "image_url"
    t.boolean  "active"
    t.decimal  "wins_avg"
    t.decimal  "draft_avg"
    t.decimal  "total_avg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "year",                         null: false
    t.string   "name",                         null: false
    t.integer  "draft"
    t.integer  "r1",           default: 0,     null: false
    t.integer  "r2",           default: 0,     null: false
    t.integer  "r3",           default: 0,     null: false
    t.integer  "r4",           default: 0,     null: false
    t.integer  "r5",           default: 0,     null: false
    t.integer  "r6",           default: 0,     null: false
    t.integer  "wins",         default: 0,     null: false
    t.integer  "pts",          default: 0,     null: false
    t.boolean  "low",          default: false, null: false
    t.decimal  "earnings",     default: 0.0,   null: false
    t.boolean  "ptschamp",     default: false, null: false
    t.boolean  "goat",         default: false, null: false
    t.integer  "manager_id",                   null: false
    t.integer  "assistant_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
