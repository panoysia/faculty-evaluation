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

ActiveRecord::Schema.define(version: 20160315005616) do

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

  create_table "career_paths", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employee_civil_service_eligibilities", force: :cascade do |t|
    t.string   "career_service",          limit: 30, null: false
    t.float    "rating",                  limit: 24, null: false
    t.date     "date_of_exam",                       null: false
    t.string   "place_of_exam",           limit: 50
    t.string   "license_number",          limit: 15
    t.date     "date_release_of_license"
    t.integer  "employee_id",                        null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "employee_civil_service_eligibilities", ["employee_id"], name: "index_employee_civil_service_eligibilities_on_employee_id"

  create_table "employee_educations", force: :cascade do |t|
    t.integer  "level",           limit: 1,     null: false
    t.string   "school_name",     limit: 69,    null: false
    t.string   "degree_course",   limit: 50,    null: false
    t.string   "grade_units",     limit: 7
    t.date     "graduated_at"
    t.date     "start_at"
    t.date     "end_at"
    t.text     "honors_received", limit: 65535
    t.integer  "employee_id",                   null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "employee_educations", ["employee_id"], name: "index_employee_educations_on_employee_id"

  create_table "employee_other_infos", force: :cascade do |t|
    t.integer  "context",     limit: 1,   null: false
    t.string   "info",        limit: 100, null: false
    t.integer  "employee_id",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_other_infos", ["employee_id"], name: "index_employee_other_infos_on_employee_id"

  create_table "employee_ratings", force: :cascade do |t|
    t.integer  "rating_period_id", null: false
    t.integer  "employee_id",      null: false
    t.string   "project_title",    null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type"
  end

  add_index "employee_ratings", ["employee_id"], name: "index_employee_ratings_on_employee_id"
  add_index "employee_ratings", ["rating_period_id"], name: "index_employee_ratings_on_rating_period_id"

  create_table "employee_trainings", force: :cascade do |t|
    t.string   "title",        limit: 100, null: false
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "no_of_hours",  limit: 2
    t.string   "conducted_by", limit: 50
    t.integer  "employee_id",              null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "employee_trainings", ["employee_id"], name: "index_employee_trainings_on_employee_id"

  create_table "employee_voluntary_works", force: :cascade do |t|
    t.string   "organization", limit: 70, null: false
    t.date     "start_at",                null: false
    t.date     "end_at",                  null: false
    t.integer  "no_of_hours",  limit: 2
    t.string   "position",     limit: 50
    t.integer  "employee_id",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_voluntary_works", ["employee_id"], name: "index_employee_voluntary_works_on_employee_id"

  create_table "employee_work_experiences", force: :cascade do |t|
    t.date     "start_at",                                        null: false
    t.date     "end_at",                                          null: false
    t.string   "position_title",        limit: 40,                null: false
    t.string   "company",               limit: 50,                null: false
    t.decimal  "monthly_salary",                   precision: 10
    t.string   "salary_grade",          limit: 7
    t.string   "status_of_appointment", limit: 20
    t.boolean  "is_gov_service",        limit: 1
    t.integer  "employee_id",                                     null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "employee_work_experiences", ["employee_id"], name: "index_employee_work_experiences_on_employee_id"

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
