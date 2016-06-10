CREATE TABLE "academic_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "subrank" integer, "position" integer(1) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "cce_min_points" integer, "cce_max_points" integer, "qce_min_points" integer, "qce_max_points" integer);
CREATE TABLE "academic_years" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "nbc_id" integer);
CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "career_path_actions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "start_at" date, "end_at" date, "description" varchar, "category" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "company" varchar, "specialization_id" integer NOT NULL);
CREATE TABLE "career_paths" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "cce_scoring_guides" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar NOT NULL, "criteria" integer NOT NULL, "points" decimal(5,2) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "description" varchar(30), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "departments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(40) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_cce_scorings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "cce_scorable_id" integer NOT NULL, "cce_scorable_type" varchar NOT NULL, "nbc_id" integer, "cce_scoring_guide_id" integer NOT NULL, "score" decimal(5,2) NOT NULL, "criteria" integer NOT NULL, "supporting_description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_civil_service_eligibilities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "career_service" varchar(30) NOT NULL, "rating" float(24) NOT NULL, "date_of_exam" date NOT NULL, "place_of_exam" varchar(50), "license_number" varchar(15), "date_release_of_license" date, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_educations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "level" integer(1) NOT NULL, "school_name" varchar(50) NOT NULL, "degree_course" varchar(50) NOT NULL, "grade_units" varchar(7), "graduated_at" date, "start_at" date, "end_at" date, "honors_received" text(65535), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "is_recent" int, "points" decimal(4,2));
CREATE TABLE "employee_other_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "context" integer(1) NOT NULL, "info" varchar(100) NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "nbc_id" integer, "cce_total_points" integer NOT NULL, "qce_total_points" integer NOT NULL, "current_rank" varchar NOT NULL, "achieved_rank" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_trainings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(100) NOT NULL, "start_at" date, "end_at" date, "no_of_hours" integer(2), "conducted_by" varchar(50), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "level" integer NOT NULL);
CREATE TABLE "employee_voluntary_works" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "organization" varchar(70) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "no_of_hours" integer(2), "position" varchar(50), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "position_title" varchar(50) NOT NULL, "company" varchar(50) NOT NULL, "monthly_salary" decimal(10), "salary_grade" varchar(7), "status_of_appointment" varchar(20), "is_gov_service" integer(1), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "middle_name" varchar(50), "name_extension" varchar(7), "designation" varchar, "gender" varchar(1), "civil_status" varchar(3), "birth_date" date, "citizenship" varchar(15), "height" varchar(5), "weight" varchar(15), "blood_type" varchar(3), "gsis_no" varchar(20), "pagibig_no" varchar(20), "philhealth_no" varchar(20), "sss_no" varchar(15), "r_address" varchar(70), "r_zip_code" varchar(5), "r_telephone_no" varchar(15), "p_address" varchar(70), "p_zip_code" varchar(5), "p_telephone_no" varchar(15), "email_address" varchar(40), "cellphone_no" varchar(15), "agency_employee_no" varchar(20), "tin" varchar(15), "academic_ranking_id" integer, "hired_date" date, "picture_file_name" varchar, "picture_content_type" varchar, "picture_file_size" integer, "picture_updated_at" datetime, "specialization_id" integer, "department_id" integer DEFAULT 0 NOT NULL);
CREATE TABLE "holidays" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "occurs_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "is_weekend" integer DEFAULT 0 NOT NULL);
CREATE TABLE "leave_service_credits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "description" varchar, "valid_at" date NOT NULL, "expire_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "academic_year_id" integer, "no_of_days" integer);
CREATE TABLE "leaves" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "filed_at" date NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "length" integer NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "academic_year_id" integer);
CREATE TABLE "nbcs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question" varchar NOT NULL, "sequence" integer NOT NULL, "rating_type" varchar NOT NULL, "instrument" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_rating_evaluations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer NOT NULL, "score" integer DEFAULT 0, "rating_id" integer NOT NULL, "rating_type" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_rating_tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "evaluator_id" integer NOT NULL, "evaluator_type" varchar NOT NULL, "rating_id" integer NOT NULL, "rating_type" varchar NOT NULL, "status" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_ratings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "qce_id" integer NOT NULL, "type" varchar NOT NULL, "evaluator_id" integer NOT NULL, "evaluator_type" varchar NOT NULL, "evaluator_name" varchar, "evaluator_position" varchar, "evaluation_context" varchar, "finished_at" date, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "instrument" varchar);
CREATE TABLE "qces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rating_period_id" integer NOT NULL, "completed" integer DEFAULT 0 NOT NULL, "has_assigned_self_rating" integer, "has_assigned_supervisor_rating" integer, "has_assigned_peer_rating" integer, "has_assigned_student_rating" integer, "support_area" varchar);
CREATE TABLE "rating_periods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "semester" integer(1) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "nbc_id" integer, "academic_year_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE TABLE "specializations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "career_path_id" integer NOT NULL, "is_generalize" integer DEFAULT 0);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "group_no" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "account_id" integer, "account_type" varchar);
CREATE INDEX "idx_cce_scorable_on_employee_cce_scorings" ON "employee_cce_scorings" ("cce_scorable_type", "cce_scorable_id");
CREATE INDEX "idx_cce_scoring_guide_id_on_employee_cce_scorings" ON "employee_cce_scorings" ("cce_scoring_guide_id");
CREATE INDEX "idx_employee_id_on_employee_cce_scorings" ON "employee_cce_scorings" ("employee_id");
CREATE INDEX "idx_nbc_id_on_employee_cce_scorings" ON "employee_cce_scorings" ("nbc_id");
CREATE INDEX "index_academic_years_on_nbc_id" ON "academic_years" ("nbc_id");
CREATE UNIQUE INDEX "index_admins_on_username" ON "admins" ("username");
CREATE INDEX "index_career_path_actions_on_specialization_id" ON "career_path_actions" ("specialization_id");
CREATE UNIQUE INDEX "index_career_paths_on_name" ON "career_paths" ("name");
CREATE UNIQUE INDEX "index_departments_on_name" ON "departments" ("name");
CREATE INDEX "index_employee_civil_service_eligibilities_on_employee_id" ON "employee_civil_service_eligibilities" ("employee_id");
CREATE INDEX "index_employee_educations_on_employee_id" ON "employee_educations" ("employee_id");
CREATE INDEX "index_employee_other_infos_on_employee_id" ON "employee_other_infos" ("employee_id");
CREATE INDEX "index_employee_rankings_on_employee_id" ON "employee_rankings" ("employee_id");
CREATE INDEX "index_employee_rankings_on_nbc_id" ON "employee_rankings" ("nbc_id");
CREATE INDEX "index_employee_trainings_on_employee_id" ON "employee_trainings" ("employee_id");
CREATE INDEX "index_employee_voluntary_works_on_employee_id" ON "employee_voluntary_works" ("employee_id");
CREATE INDEX "index_employee_work_experiences_on_employee_id" ON "employee_work_experiences" ("employee_id");
CREATE INDEX "index_employees_on_academic_ranking_id" ON "employees" ("academic_ranking_id");
CREATE INDEX "index_employees_on_department_id" ON "employees" ("department_id");
CREATE INDEX "index_employees_on_specialization_id" ON "employees" ("specialization_id");
CREATE INDEX "index_leave_service_credits_on_academic_year_id" ON "leave_service_credits" ("academic_year_id");
CREATE INDEX "index_leave_service_credits_on_employee_id" ON "leave_service_credits" ("employee_id");
CREATE INDEX "index_leaves_on_academic_year_id" ON "leaves" ("academic_year_id");
CREATE INDEX "index_leaves_on_employee_id" ON "leaves" ("employee_id");
CREATE INDEX "index_qce_rating_evaluations_on_question_id" ON "qce_rating_evaluations" ("question_id");
CREATE INDEX "index_qce_rating_evaluations_on_rating_type_and_rating_id" ON "qce_rating_evaluations" ("rating_type", "rating_id");
CREATE INDEX "index_qce_rating_tasks_on_employee_id" ON "qce_rating_tasks" ("employee_id");
CREATE INDEX "index_qce_rating_tasks_on_evaluator_type_and_evaluator_id" ON "qce_rating_tasks" ("evaluator_type", "evaluator_id");
CREATE INDEX "index_qce_rating_tasks_on_rating_type_and_rating_id" ON "qce_rating_tasks" ("rating_type", "rating_id");
CREATE INDEX "index_qce_ratings_on_evaluator_type_and_evaluator_id" ON "qce_ratings" ("evaluator_type", "evaluator_id");
CREATE INDEX "index_qce_ratings_on_qce_id" ON "qce_ratings" ("qce_id");
CREATE INDEX "index_qces_on_employee_id" ON "qces" ("employee_id");
CREATE INDEX "index_qces_on_rating_period_id" ON "qces" ("rating_period_id");
CREATE INDEX "index_rating_periods_on_academic_year_id" ON "rating_periods" ("academic_year_id");
CREATE INDEX "index_rating_periods_on_nbc_id" ON "rating_periods" ("nbc_id");
CREATE INDEX "index_specializations_on_career_path_id" ON "specializations" ("career_path_id");
CREATE UNIQUE INDEX "index_specializations_on_name" ON "specializations" ("name");
CREATE INDEX "index_users_on_account_type_and_account_id" ON "users" ("account_type", "account_id");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('0');

INSERT INTO schema_migrations (version) VALUES ('20160403082249');

INSERT INTO schema_migrations (version) VALUES ('20160403092515');

INSERT INTO schema_migrations (version) VALUES ('20160403092932');

INSERT INTO schema_migrations (version) VALUES ('20160403093208');

INSERT INTO schema_migrations (version) VALUES ('20160403160805');

INSERT INTO schema_migrations (version) VALUES ('20160403173707');

INSERT INTO schema_migrations (version) VALUES ('20160403183716');

INSERT INTO schema_migrations (version) VALUES ('20160404224020');

INSERT INTO schema_migrations (version) VALUES ('20160410081552');

INSERT INTO schema_migrations (version) VALUES ('20160410082151');

INSERT INTO schema_migrations (version) VALUES ('20160411003535');

INSERT INTO schema_migrations (version) VALUES ('20160411173411');

INSERT INTO schema_migrations (version) VALUES ('20160411192310');

INSERT INTO schema_migrations (version) VALUES ('20160412003626');

INSERT INTO schema_migrations (version) VALUES ('20160412005438');

INSERT INTO schema_migrations (version) VALUES ('20160412010849');

INSERT INTO schema_migrations (version) VALUES ('20160412051149');

INSERT INTO schema_migrations (version) VALUES ('20160412194540');

INSERT INTO schema_migrations (version) VALUES ('20160413004607');

INSERT INTO schema_migrations (version) VALUES ('20160413005829');

INSERT INTO schema_migrations (version) VALUES ('20160413035513');

INSERT INTO schema_migrations (version) VALUES ('20160413101955');

INSERT INTO schema_migrations (version) VALUES ('20160413103329');

INSERT INTO schema_migrations (version) VALUES ('20160413104948');

INSERT INTO schema_migrations (version) VALUES ('20160413183043');

INSERT INTO schema_migrations (version) VALUES ('20160414005218');

INSERT INTO schema_migrations (version) VALUES ('20160414014338');

INSERT INTO schema_migrations (version) VALUES ('20160414040426');

INSERT INTO schema_migrations (version) VALUES ('20160417192001');

INSERT INTO schema_migrations (version) VALUES ('20160425191415');

INSERT INTO schema_migrations (version) VALUES ('20160425192223');

INSERT INTO schema_migrations (version) VALUES ('20160513042450');

INSERT INTO schema_migrations (version) VALUES ('20160519033407');

INSERT INTO schema_migrations (version) VALUES ('20160519040658');

INSERT INTO schema_migrations (version) VALUES ('20160521020005');

INSERT INTO schema_migrations (version) VALUES ('20160521020439');

INSERT INTO schema_migrations (version) VALUES ('20160522141202');

INSERT INTO schema_migrations (version) VALUES ('20160522193118');

INSERT INTO schema_migrations (version) VALUES ('20160523074117');

INSERT INTO schema_migrations (version) VALUES ('20160525061029');

INSERT INTO schema_migrations (version) VALUES ('20160526064319');

INSERT INTO schema_migrations (version) VALUES ('20160526064928');

INSERT INTO schema_migrations (version) VALUES ('20160526065743');

INSERT INTO schema_migrations (version) VALUES ('20160526085418');

INSERT INTO schema_migrations (version) VALUES ('20160527145207');

INSERT INTO schema_migrations (version) VALUES ('20160527161605');

INSERT INTO schema_migrations (version) VALUES ('20160529031317');

INSERT INTO schema_migrations (version) VALUES ('20160529161558');

INSERT INTO schema_migrations (version) VALUES ('20160602010412');

INSERT INTO schema_migrations (version) VALUES ('20160602021958');

INSERT INTO schema_migrations (version) VALUES ('20160602082026');

INSERT INTO schema_migrations (version) VALUES ('20160603203048');

INSERT INTO schema_migrations (version) VALUES ('20160607075722');

INSERT INTO schema_migrations (version) VALUES ('20160607211524');

INSERT INTO schema_migrations (version) VALUES ('20160608020807');

INSERT INTO schema_migrations (version) VALUES ('20160608022052');

INSERT INTO schema_migrations (version) VALUES ('20160608052826');

INSERT INTO schema_migrations (version) VALUES ('20160608054934');

INSERT INTO schema_migrations (version) VALUES ('20160608072840');

INSERT INTO schema_migrations (version) VALUES ('20160608101448');

INSERT INTO schema_migrations (version) VALUES ('20160610014146');

INSERT INTO schema_migrations (version) VALUES ('20160610035517');

INSERT INTO schema_migrations (version) VALUES ('20160610041448');

INSERT INTO schema_migrations (version) VALUES ('20160610075258');

