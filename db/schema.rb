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

ActiveRecord::Schema.define(version: 20140420153813) do

  create_table "animations", force: true do |t|
    t.string   "title"
    t.string   "owner"
    t.string   "cat"
    t.text     "detail"
    t.integer  "episodes"
    t.string   "uid"
    t.string   "sid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.text     "profile"
    t.text     "hobby"
    t.text     "skill"
    t.text     "lately"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.string   "what"
    t.text     "how"
    t.string   "who"
    t.string   "with"
    t.text     "others"
    t.date     "when_from"
    t.date     "when_to"
    t.string   "span_from"
    t.string   "span_to"
    t.boolean  "private"
    t.integer  "uid"
    t.string   "sid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
