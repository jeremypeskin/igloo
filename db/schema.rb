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

ActiveRecord::Schema.define(version: 20190210234230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "unit_id"
    t.integer  "amount"
    t.string   "description"
    t.date     "date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "expense_type", default: 0
    t.integer  "category",     default: 0
  end

  add_index "expenses", ["property_id"], name: "index_expenses_on_property_id", using: :btree
  add_index "expenses", ["unit_id"], name: "index_expenses_on_unit_id", using: :btree
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "unit_id"
    t.string   "description"
    t.integer  "amount"
    t.date     "date"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "invoices", ["property_id"], name: "index_invoices_on_property_id", using: :btree
  add_index "invoices", ["unit_id"], name: "index_invoices_on_unit_id", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "price"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "mortgage_interest"
    t.integer  "mortgage_term"
    t.integer  "mortgage_principal"
    t.date     "mortgage_start_date"
    t.boolean  "recurring_mortgage",  default: false
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "recurring_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "unit_id"
    t.integer  "amount"
    t.string   "description"
    t.integer  "category"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "event_type",  default: 0
  end

  add_index "recurring_events", ["property_id"], name: "index_recurring_events_on_property_id", using: :btree
  add_index "recurring_events", ["unit_id"], name: "index_recurring_events_on_unit_id", using: :btree
  add_index "recurring_events", ["user_id"], name: "index_recurring_events_on_user_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.string   "name"
    t.integer  "rent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "units", ["property_id"], name: "index_units_on_property_id", using: :btree
  add_index "units", ["user_id"], name: "index_units_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
