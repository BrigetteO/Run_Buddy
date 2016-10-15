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

ActiveRecord::Schema.define(version: 20161015023725) do

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kudos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "runs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.decimal  "miles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tides", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.string   "day"
    t.integer  "predictions_in_ft"
    t.integer  "predictions_in_cm"
    t.string   "highlow"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              null: false
    t.string   "encrypted_password"
    t.string   "first_name",                         null: false
    t.string   "last_name",                          null: false
    t.string   "user_name",                          null: false
    t.integer  "age",                                null: false
    t.string   "gender",                             null: false
    t.string   "city",                               null: false
    t.string   "state",                              null: false
    t.integer  "zipcode",                            null: false
    t.integer  "pace",                               null: false
    t.string   "availability",                       null: false
    t.boolean  "buddy_pref",                         null: false
    t.string   "run_pref",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
