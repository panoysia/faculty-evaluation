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

ActiveRecord::Schema.define(version: 20160403042242) do

  create_table "academic_rankings", force: :cascade do |t|
    t.string   "name",           limit: 50, null: false
    t.integer  "subrank"
    t.integer  "position",       limit: 1,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "cce_min_points"
    t.integer  "cce_max_points"
    t.integer  "qce_min_points"
    t.integer  "qce_max_points"
  end

  create_table "academic_years", force: :cascade do |t|
    t.date     "start_at",   null: false
    t.date     "end_at",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "school_name",     limit: 50,    null: false
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

  create_table "employee_rankings", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "nbc_id"
    t.integer  "cce_total_points", null: false
    t.integer  "qce_total_points", null: false
    t.string   "current_rank",     null: false
    t.string   "achieved_rank"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "employee_rankings", ["employee_id"], name: "index_employee_rankings_on_employee_id"
  add_index "employee_rankings", ["nbc_id"], name: "index_employee_rankings_on_nbc_id"

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
    t.string   "position_title",        limit: 50,                null: false
    t.string   "company",               limit: 50,                null: false
    t.decimal  "monthly_salary",                   precision: 10
    t.string   "salary_grade",          limit: 7
    t.string   "status_of_appointment", limit: 20
    t.integer  "is_gov_service",        limit: 1
    t.integer  "employee_id",                                     null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "employee_work_experiences", ["employee_id"], name: "index_employee_work_experiences_on_employee_id"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",           limit: 50, null: false
    t.string   "last_name",            limit: 50, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "middle_name",          limit: 50
    t.string   "name_extension",       limit: 7
    t.string   "designation"
    t.string   "gender",               limit: 1
    t.string   "civil_status",         limit: 3
    t.date     "birth_date"
    t.string   "citizenship",          limit: 15
    t.string   "height",               limit: 5
    t.string   "weight",               limit: 15
    t.string   "blood_type",           limit: 3
    t.string   "gsis_no",              limit: 20
    t.string   "pagibig_no",           limit: 20
    t.string   "philhealth_no",        limit: 20
    t.string   "sss_no",               limit: 15
    t.string   "r_address",            limit: 70
    t.string   "r_zip_code",           limit: 5
    t.string   "r_telephone_no",       limit: 15
    t.string   "p_address",            limit: 70
    t.string   "p_zip_code",           limit: 5
    t.string   "p_telephone_no",       limit: 15
    t.string   "email_address",        limit: 40
    t.string   "cellphone_no",         limit: 15
    t.string   "agency_employee_no",   limit: 20
    t.string   "tin",                  limit: 15
    t.integer  "academic_ranking_id"
    t.date     "hired_date"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "specialization_id"
  end

  add_index "employees", ["academic_ranking_id"], name: "index_employees_on_academic_ranking_id"
  add_index "employees", ["specialization_id"], name: "index_employees_on_specialization_id"

  create_table "leave_service_credits", force: :cascade do |t|
    t.integer  "employee_id",      null: false
    t.string   "description"
    t.date     "valid_at",         null: false
    t.date     "expire_at",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  add_index "leave_service_credits", ["academic_year_id"], name: "index_leave_service_credits_on_academic_year_id"
  add_index "leave_service_credits", ["employee_id"], name: "index_leave_service_credits_on_employee_id"

  create_table "leaves", force: :cascade do |t|
    t.date     "filed_at",         null: false
    t.date     "start_at",         null: false
    t.date     "end_at",           null: false
    t.integer  "length",           null: false
    t.integer  "employee_id",      null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
  end

  add_index "leaves", ["academic_year_id"], name: "index_leaves_on_academic_year_id"
  add_index "leaves", ["employee_id"], name: "index_leaves_on_employee_id"

  create_table "nbcs", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rating_periods", force: :cascade do |t|
    t.integer  "semester",         limit: 1, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "nbc_id"
    t.integer  "academic_year_id"
  end

  add_index "rating_periods", ["academic_year_id"], name: "index_rating_periods_on_academic_year_id"
  add_index "rating_periods", ["nbc_id"], name: "index_rating_periods_on_nbc_id"

  create_table "specializations", force: :cascade do |t|
    t.string   "name",       limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "specializations", ["name"], name: "index_specializations_on_name", unique: true

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
    t.integer  "account_id"
    t.string   "account_type"
  end

  add_index "users", ["account_type", "account_id"], name: "index_users_on_account_type_and_account_id"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
