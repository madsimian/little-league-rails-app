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

ActiveRecord::Schema.define(version: 20141130203308) do

  create_table "coaches", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.date     "birthday"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", force: true do |t|
    t.string   "surname"
    t.string   "phone_home"
    t.string   "phone_cell"
    t.string   "email"
    t.string   "mailing_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "location"
    t.date     "date"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matchups", force: true do |t|
    t.integer  "team_id"
    t.integer  "game_id"
    t.integer  "score"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "nickname"
    t.date     "birthday"
    t.integer  "team_id"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "coach_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
