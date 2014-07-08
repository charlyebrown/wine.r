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

ActiveRecord::Schema.define(version: 20140708151414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.date     "birthday"
    t.string   "preferences"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "username"
  end

  create_table "wine_reviews", force: true do |t|
    t.string  "title"
    t.text    "content"
    t.integer "user_id"
    t.integer "wine_id"
    t.integer "rating"
  end

  create_table "wines", force: true do |t|
    t.string   "name"
    t.string   "grape_blend"
    t.integer  "year"
    t.string   "region"
    t.string   "vineyard"
    t.text     "description"
    t.text     "flavor_profile"
    t.string   "color"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end