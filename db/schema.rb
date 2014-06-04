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

ActiveRecord::Schema.define(version: 20140604183804) do

  create_table "accounts", force: true do |t|
    t.string   "uid"
    t.integer  "balance"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["uid"], name: "index_accounts_on_uid"

  create_table "credentials", force: true do |t|
    t.integer  "maker_id"
    t.integer  "account_id"
    t.string   "right"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "makers", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.integer  "zip"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator",          default: false
  end

  add_index "makers", ["confirmation_token"], name: "index_makers_on_confirmation_token", unique: true
  add_index "makers", ["email"], name: "index_makers_on_email", unique: true
  add_index "makers", ["reset_password_token"], name: "index_makers_on_reset_password_token", unique: true
  add_index "makers", ["unlock_token"], name: "index_makers_on_unlock_token", unique: true

  create_table "memberships", force: true do |t|
    t.date     "date"
    t.integer  "entity_id"
    t.integer  "maker_id"
    t.integer  "fee"
    t.boolean  "newsletter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["entity_id"], name: "index_memberships_on_entity_id"
  add_index "memberships", ["maker_id"], name: "index_memberships_on_maker_id"

  create_table "records", force: true do |t|
    t.integer  "account_id"
    t.text     "description"
    t.integer  "amount"
    t.integer  "wire_transfer_id"
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "records", ["account_id"], name: "index_records_on_account_id"
  add_index "records", ["wire_transfer_id"], name: "index_records_on_wire_transfer_id"

  create_table "transfers", force: true do |t|
    t.integer  "source_id"
    t.integer  "destination_id"
    t.integer  "maker_id"
    t.integer  "amount"
    t.text     "description"
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
