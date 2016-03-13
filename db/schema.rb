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

ActiveRecord::Schema.define(version: 20160312055110) do

  create_table "academic_rankings", force: :cascade do |t|
    t.string   "rank",       limit: 50, null: false
    t.integer  "position",   limit: 1,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "username",        limit: 20, null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "area_instruments", force: :cascade do |t|
    t.string   "area",       limit: 50, null: false
    t.string   "instrument", limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",         limit: 50, null: false
    t.string   "last_name",          limit: 50, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "middle_name",        limit: 50
    t.string   "name_extension",     limit: 7
    t.string   "designation"
    t.string   "gender",             limit: 1
    t.string   "civil_status",       limit: 3
    t.date     "birth_date"
    t.string   "citizenship",        limit: 15
    t.string   "height",             limit: 5
    t.string   "weight",             limit: 5
    t.string   "blood_type",         limit: 3
    t.string   "gsis_no",            limit: 20
    t.string   "pagibig_no",         limit: 20
    t.string   "philhealth_no",      limit: 20
    t.string   "sss_no",             limit: 15
    t.string   "r_address",          limit: 70
    t.string   "r_zip_code",         limit: 5
    t.string   "r_telephone_no",     limit: 15
    t.string   "p_address",          limit: 70
    t.string   "p_zip_code",         limit: 5
    t.string   "p_telephone_no",     limit: 15
    t.string   "email_address",      limit: 40
    t.string   "cellphone_no",       limit: 15
    t.string   "agency_employee_no", limit: 20
    t.string   "tin",                limit: 15
  end

  create_table "leaves", force: :cascade do |t|
    t.date     "filed_at",    null: false
    t.date     "start_at",    null: false
    t.date     "end_at",      null: false
    t.integer  "length",      null: false
    t.integer  "employee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "leaves", ["employee_id"], name: "index_leaves_on_employee_id"

  create_table "rating_periods", force: :cascade do |t|
    t.integer  "start_at",                         null: false
    t.integer  "end_at",                           null: false
    t.integer  "semester",   limit: 1,             null: false
    t.integer  "status",               default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 50, null: false
    t.string   "last_name",  limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 20, null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
