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

ActiveRecord::Schema.define(version: 20151118234903) do

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.text     "department_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "receipt_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchasers", force: :cascade do |t|
    t.string   "purchaser_name"
    t.string   "worker_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "puroptions", force: :cascade do |t|
    t.string   "puroption_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipts", force: :cascade do |t|
    t.datetime "date"
    t.string   "account_number"
    t.string   "university_id"
    t.decimal  "tax_amount",      precision: 8, scale: 2
    t.decimal  "purchase_amount", precision: 8, scale: 2
    t.boolean  "approved",                                default: false
    t.text     "descript"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "purchaser_id"
    t.integer  "puroption_id"
    t.integer  "vendor_id"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.boolean  "emailauth",       default: false
    t.boolean  "admin",           default: false
    t.string   "seid"
    t.string   "title"
    t.boolean  "active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",          default: "/default.jpg"
    t.string   "password_digest"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "vendor_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
