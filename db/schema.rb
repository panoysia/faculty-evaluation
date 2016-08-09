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

ActiveRecord::Schema.define(version: 20160809064729) do

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
    t.integer  "nbc_id"
  end

  add_index "academic_years", ["nbc_id"], name: "index_academic_years_on_nbc_id"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        limit: 20, null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "career_path_actions", force: :cascade do |t|
    t.string   "name",              null: false
    t.date     "start_at"
    t.date     "end_at"
    t.string   "description"
    t.integer  "category",          null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "company"
    t.integer  "specialization_id", null: false
  end

  add_index "career_path_actions", ["specialization_id"], name: "index_career_path_actions_on_specialization_id"

  create_table "career_paths", force: :cascade do |t|
    t.string   "name",       limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "career_paths", ["name"], name: "index_career_paths_on_name", unique: true

  create_table "cce_scoring_guides", force: :cascade do |t|
    t.string   "description",                         null: false
    t.integer  "criteria",                            null: false
    t.decimal  "points",      precision: 5, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",  limit: 50, null: false
    t.string   "last_name",   limit: 50, null: false
    t.string   "description", limit: 30
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "creative_work_criteria", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 40, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "departments", ["name"], name: "index_departments_on_name", unique: true

  create_table "discovery_criteria", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employee_academic_advisories", force: :cascade do |t|
    t.integer  "employee_id",             null: false
    t.string   "title",       limit: 150, null: false
    t.integer  "nature",                  null: false
    t.date     "start_at",                null: false
    t.date     "end_at",                  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_academic_advisories", ["employee_id"], name: "index_employee_academic_advisories_on_employee_id"

  create_table "employee_academic_honors", force: :cascade do |t|
    t.integer  "employee_id",              null: false
    t.string   "award",        limit: 150, null: false
    t.integer  "degree_type",              null: false
    t.integer  "honor_type",               null: false
    t.string   "school",       limit: 150, null: false
    t.date     "date_awarded",             null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "employee_academic_honors", ["employee_id"], name: "index_employee_academic_honors_on_employee_id"

  create_table "employee_accreditation_services", force: :cascade do |t|
    t.integer  "employee_id",                               null: false
    t.string   "name",          limit: 150,                 null: false
    t.string   "participation", limit: 150, default: "",    null: false
    t.date     "start_at",                                  null: false
    t.date     "end_at",                                    null: false
    t.boolean  "is_current",                default: false, null: false
    t.integer  "no_of_years",                               null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "agency",        limit: 150, default: "",    null: false
  end

  add_index "employee_accreditation_services", ["employee_id"], name: "index_employee_accreditation_services_on_employee_id"

  create_table "employee_assessor_services", force: :cascade do |t|
    t.integer  "employee_id",                             null: false
    t.string   "name",        limit: 150,                 null: false
    t.string   "agency",      limit: 150,                 null: false
    t.date     "start_at",                                null: false
    t.date     "end_at"
    t.boolean  "is_current",              default: false, null: false
    t.integer  "no_of_years",             default: 0,     null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "employee_assessor_services", ["employee_id"], name: "index_employee_assessor_services_on_employee_id"

  create_table "employee_awards", force: :cascade do |t|
    t.integer  "employee_id",                           null: false
    t.string   "name",         limit: 150,              null: false
    t.integer  "level",                                 null: false
    t.date     "date_awarded",                          null: false
    t.string   "description",  limit: 150, default: "", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "employee_awards", ["employee_id"], name: "index_employee_awards_on_employee_id"

  create_table "employee_cce_scorings", force: :cascade do |t|
    t.integer  "employee_id",                                    null: false
    t.integer  "cce_scorable_id",                                null: false
    t.string   "cce_scorable_type",                              null: false
    t.integer  "nbc_id"
    t.integer  "cce_scoring_guide_id",                           null: false
    t.decimal  "points",                 precision: 5, scale: 2, null: false
    t.integer  "criteria",                                       null: false
    t.string   "supporting_description"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "employee_cce_scorings", ["cce_scorable_type", "cce_scorable_id"], name: "idx_cce_scorable_on_employee_cce_scorings"
  add_index "employee_cce_scorings", ["cce_scoring_guide_id"], name: "idx_cce_scoring_guide_id_on_employee_cce_scorings"
  add_index "employee_cce_scorings", ["employee_id"], name: "idx_employee_id_on_employee_cce_scorings"
  add_index "employee_cce_scorings", ["nbc_id"], name: "idx_nbc_id_on_employee_cce_scorings"

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

  create_table "employee_community_outreaches", force: :cascade do |t|
    t.string   "project_name",      limit: 150, null: false
    t.string   "sponsoring_agency", limit: 150, null: false
    t.date     "start_at",                      null: false
    t.date     "end_at",                        null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "employee_id",                   null: false
  end

  add_index "employee_community_outreaches", ["employee_id"], name: "index_employee_community_outreaches_on_employee_id"

  create_table "employee_creative_works", force: :cascade do |t|
    t.string   "patent_no",                   null: false
    t.integer  "year_patented",               null: false
    t.string   "description",     limit: 150
    t.integer  "employee_id",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",                        null: false
    t.integer  "competitiveness",             null: false
  end

  add_index "employee_creative_works", ["employee_id"], name: "index_employee_creative_works_on_employee_id"

  create_table "employee_creative_works_criteria", id: false, force: :cascade do |t|
    t.integer "employee_creative_work_id",  null: false
    t.integer "creative_work_criterium_id", null: false
  end

  add_index "employee_creative_works_criteria", ["creative_work_criterium_id"], name: "idx_ecwc_on_creative_work_criterium_id"
  add_index "employee_creative_works_criteria", ["employee_creative_work_id"], name: "idx_ecwc_on_employee_creative_work_id"

  create_table "employee_discoveries", force: :cascade do |t|
    t.string   "patent_no",                 null: false
    t.integer  "year_patented",             null: false
    t.string   "description",   limit: 150
    t.integer  "employee_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",                      null: false
  end

  add_index "employee_discoveries", ["employee_id"], name: "index_employee_discoveries_on_employee_id"

  create_table "employee_discoveries_criteria", id: false, force: :cascade do |t|
    t.integer "employee_discovery_id",  null: false
    t.integer "discovery_criterium_id", null: false
  end

  add_index "employee_discoveries_criteria", ["discovery_criterium_id"], name: "idx_edc_on_discovery_criterium_id"
  add_index "employee_discoveries_criteria", ["employee_discovery_id"], name: "idx_edc_on_employee_discovery_id"

  create_table "employee_educations", force: :cascade do |t|
    t.integer  "level",            limit: 1,     null: false
    t.string   "school_name",      limit: 50,    null: false
    t.string   "degree_course",    limit: 50,    null: false
    t.integer  "grade_units",      limit: 7
    t.date     "graduated_at"
    t.date     "start_at"
    t.date     "end_at"
    t.text     "honors_received",  limit: 65535
    t.integer  "employee_id",                    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "attainment_level"
    t.integer  "criteria"
  end

  add_index "employee_educations", ["attainment_level"], name: "index_employee_educations_on_attainment_level"
  add_index "employee_educations", ["criteria"], name: "index_employee_educations_on_criteria"
  add_index "employee_educations", ["employee_id"], name: "index_employee_educations_on_employee_id"

  create_table "employee_innovations", force: :cascade do |t|
    t.string   "patent_no",                 null: false
    t.integer  "year_patented",             null: false
    t.string   "description",   limit: 150
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "employee_id",               null: false
    t.string   "name",                      null: false
  end

  add_index "employee_innovations", ["employee_id"], name: "idx_emp_innovations_on_emp_id"

  create_table "employee_innovations_criteria", id: false, force: :cascade do |t|
    t.integer "employee_innovation_id",  null: false
    t.integer "innovation_criterium_id", null: false
  end

  add_index "employee_innovations_criteria", ["employee_innovation_id"], name: "idx_eic_on_employee_innovation_id"
  add_index "employee_innovations_criteria", ["innovation_criterium_id"], name: "idx_eic_on_innovation_criterium_id"

  create_table "employee_instructional_manuals", force: :cascade do |t|
    t.string   "name",         limit: 50,               null: false
    t.date     "published_at",                          null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "category"
    t.integer  "employee_id",                           null: false
    t.string   "description",  limit: 150, default: "", null: false
  end

  add_index "employee_instructional_manuals", ["employee_id"], name: "idx_emp_instructioinal_manuals_on_emp_id"

  create_table "employee_inventions", force: :cascade do |t|
    t.string   "patent_no",                 null: false
    t.integer  "year_patented",             null: false
    t.string   "description",   limit: 150
    t.integer  "employee_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "patent_type",               null: false
    t.string   "name",                      null: false
  end

  add_index "employee_inventions", ["employee_id"], name: "index_employee_inventions_on_employee_id"

  create_table "employee_other_infos", force: :cascade do |t|
    t.integer  "context",     limit: 1,   null: false
    t.string   "info",        limit: 100, null: false
    t.integer  "employee_id",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_other_infos", ["employee_id"], name: "index_employee_other_infos_on_employee_id"

  create_table "employee_professional_examinations", force: :cascade do |t|
    t.string   "title",       limit: 150, null: false
    t.string   "agency_name", limit: 150, null: false
    t.date     "date_passed",             null: false
    t.integer  "category",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "employee_id",             null: false
  end

  add_index "employee_professional_examinations", ["employee_id"], name: "index_employee_professional_examinations_on_employee_id"

  create_table "employee_professional_memberships", force: :cascade do |t|
    t.integer  "employee_id",                    null: false
    t.string   "organization",       limit: 150, null: false
    t.date     "date_of_membership",             null: false
    t.integer  "organization_type",              null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "membership_type"
  end

  add_index "employee_professional_memberships", ["employee_id"], name: "index_employee_professional_memberships_on_employee_id"

  create_table "employee_professional_reviews", force: :cascade do |t|
    t.integer  "employee_id",             null: false
    t.string   "name",        limit: 150, null: false
    t.date     "occurred_at",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "review_type",             null: false
  end

  add_index "employee_professional_reviews", ["employee_id"], name: "index_employee_professional_reviews_on_employee_id"

  create_table "employee_professional_services", force: :cascade do |t|
    t.integer  "employee_id",                                      null: false
    t.string   "title",                   limit: 150
    t.integer  "service_type",                                     null: false
    t.integer  "level",                                            null: false
    t.string   "nature_of_participation", limit: 150, default: "", null: false
    t.string   "sponsoring_agency",       limit: 150,              null: false
    t.date     "start_at",                                         null: false
    t.date     "end_at",                                           null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "employee_professional_services", ["employee_id"], name: "index_employee_professional_services_on_employee_id"

  create_table "employee_publications", force: :cascade do |t|
    t.string   "title",                                        null: false
    t.integer  "role",                                         null: false
    t.integer  "academic_level",                               null: false
    t.string   "publisher"
    t.date     "date_of_publication",                          null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "employee_id",                                  null: false
    t.string   "description",         limit: 150, default: "", null: false
  end

  add_index "employee_publications", ["employee_id"], name: "idx_emp_publications_on_emp_id"

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

  create_table "employee_scholarships", force: :cascade do |t|
    t.integer  "employee_id",                   null: false
    t.string   "title",             limit: 150, null: false
    t.string   "sponsoring_agency", limit: 150, null: false
    t.date     "date_granted",                  null: false
    t.integer  "scholarship_type",              null: false
    t.integer  "degree_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "employee_scholarships", ["employee_id"], name: "index_employee_scholarships_on_employee_id"

  create_table "employee_technical_articles", force: :cascade do |t|
    t.string   "name",         limit: 50,  null: false
    t.integer  "level",                    null: false
    t.date     "published_at",             null: false
    t.string   "description",  limit: 150
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "employee_id",              null: false
  end

  add_index "employee_technical_articles", ["employee_id"], name: "idx_emp_technical_articles_on_emp_id"

  create_table "employee_trainings", force: :cascade do |t|
    t.string   "title",                   limit: 100,              null: false
    t.date     "start_at",                                         null: false
    t.date     "end_at",                                           null: false
    t.integer  "no_of_days",              limit: 2
    t.string   "conducted_by",            limit: 50,               null: false
    t.integer  "employee_id",                                      null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "level",                                            null: false
    t.string   "nature_of_participation",             default: "", null: false
    t.integer  "category",                                         null: false
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
    t.integer  "department_id"
  end

  add_index "employees", ["academic_ranking_id"], name: "index_employees_on_academic_ranking_id"
  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["specialization_id"], name: "index_employees_on_specialization_id"

  create_table "faculty_evaluations", force: :cascade do |t|
    t.integer  "employee_id",  null: false
    t.integer  "nbc_id",       null: false
    t.string   "current_rank", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "faculty_evaluations", ["employee_id"], name: "index_faculty_evaluations_on_employee_id"
  add_index "faculty_evaluations", ["nbc_id"], name: "index_faculty_evaluations_on_nbc_id"

  create_table "holidays", force: :cascade do |t|
    t.string   "name",                   null: false
    t.date     "occurs_at",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "is_weekend", default: 0, null: false
  end

  create_table "innovation_criteria", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leave_service_credits", force: :cascade do |t|
    t.integer  "employee_id",      null: false
    t.string   "description"
    t.date     "valid_at",         null: false
    t.date     "expire_at",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "academic_year_id"
    t.integer  "no_of_days"
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
    t.string   "name",                    null: false
    t.string   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 1, null: false
  end

  create_table "qce_questions", force: :cascade do |t|
    t.string   "question",    null: false
    t.integer  "sequence",    null: false
    t.string   "rating_type", null: false
    t.string   "instrument",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qce_rating_evaluations", force: :cascade do |t|
    t.integer  "question_id",             null: false
    t.integer  "score",       default: 0
    t.integer  "rating_id",               null: false
    t.string   "rating_type",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "qce_rating_evaluations", ["question_id"], name: "index_qce_rating_evaluations_on_question_id"
  add_index "qce_rating_evaluations", ["rating_type", "rating_id"], name: "index_qce_rating_evaluations_on_rating_type_and_rating_id"

  create_table "qce_rating_tasks", force: :cascade do |t|
    t.integer  "employee_id",    null: false
    t.integer  "evaluator_id",   null: false
    t.string   "evaluator_type", null: false
    t.integer  "rating_id",      null: false
    t.string   "rating_type",    null: false
    t.integer  "status",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "qce_rating_tasks", ["employee_id"], name: "index_qce_rating_tasks_on_employee_id"
  add_index "qce_rating_tasks", ["evaluator_type", "evaluator_id"], name: "index_qce_rating_tasks_on_evaluator_type_and_evaluator_id"
  add_index "qce_rating_tasks", ["rating_type", "rating_id"], name: "index_qce_rating_tasks_on_rating_type_and_rating_id"

  create_table "qce_ratings", force: :cascade do |t|
    t.integer  "qce_id",             null: false
    t.string   "type",               null: false
    t.integer  "evaluator_id",       null: false
    t.string   "evaluator_type",     null: false
    t.string   "evaluator_name"
    t.string   "evaluator_position"
    t.string   "evaluation_context"
    t.date     "finished_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "instrument"
  end

  add_index "qce_ratings", ["evaluator_type", "evaluator_id"], name: "index_qce_ratings_on_evaluator_type_and_evaluator_id"
  add_index "qce_ratings", ["qce_id"], name: "index_qce_ratings_on_qce_id"

  create_table "qces", force: :cascade do |t|
    t.integer  "employee_id",                                null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "rating_period_id",                           null: false
    t.integer  "completed",                      default: 0, null: false
    t.integer  "has_assigned_self_rating"
    t.integer  "has_assigned_supervisor_rating"
    t.integer  "has_assigned_peer_rating"
    t.integer  "has_assigned_student_rating"
    t.string   "support_area"
  end

  add_index "qces", ["employee_id"], name: "index_qces_on_employee_id"
  add_index "qces", ["rating_period_id"], name: "index_qces_on_rating_period_id"

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
    t.string   "name",           limit: 100,             null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "career_path_id",                         null: false
    t.integer  "is_generalize",              default: 0
  end

  add_index "specializations", ["career_path_id"], name: "index_specializations_on_career_path_id"
  add_index "specializations", ["name"], name: "index_specializations_on_name", unique: true

  create_table "students", force: :cascade do |t|
    t.string   "first_name",    limit: 50, null: false
    t.string   "last_name",     limit: 50, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "department_id"
  end

  add_index "students", ["department_id"], name: "index_students_on_department_id"

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
