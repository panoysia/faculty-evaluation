CREATE TABLE "academic_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "position" integer(1) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "cce_min_points" integer, "cce_max_points" integer, "qce_min_points" integer, "qce_max_points" integer, "subrank" integer);
CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "area_instruments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "area" varchar(50) NOT NULL, "instrument" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "career_paths" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_civil_service_eligibilities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "career_service" varchar(30) NOT NULL, "rating" float(24) NOT NULL, "date_of_exam" date NOT NULL, "place_of_exam" varchar(50), "license_number" varchar(15), "date_release_of_license" date, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_educations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "level" integer(1) NOT NULL, "school_name" varchar(50) NOT NULL, "degree_course" varchar(50) NOT NULL, "grade_units" varchar(7), "graduated_at" date, "start_at" date, "end_at" date, "honors_received" text(65535), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_other_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "context" integer(1) NOT NULL, "info" varchar(100) NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "nbc_id" integer, "cce_total_points" integer NOT NULL, "qce_total_points" integer NOT NULL, "current_rank" varchar NOT NULL, "achieved_rank" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_ratings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "rating_period_id" integer NOT NULL, "employee_id" integer NOT NULL, "project_title" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "type" varchar);
CREATE TABLE "employee_trainings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(100) NOT NULL, "start_at" date, "end_at" date, "no_of_hours" integer(2), "conducted_by" varchar(50), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_voluntary_works" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "organization" varchar(70) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "no_of_hours" integer(2), "position" varchar(50), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "position_title" varchar(50) NOT NULL, "company" varchar(50) NOT NULL, "monthly_salary" decimal(10), "salary_grade" varchar(7), "status_of_appointment" varchar(20), "is_gov_service" integer(1), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "middle_name" varchar(50), "name_extension" varchar(7), "designation" varchar, "gender" varchar(1), "civil_status" varchar(3), "birth_date" date, "citizenship" varchar(15), "height" varchar(5), "weight" varchar(15), "blood_type" varchar(3), "gsis_no" varchar(20), "pagibig_no" varchar(20), "philhealth_no" varchar(20), "sss_no" varchar(15), "r_address" varchar(70), "r_zip_code" varchar(5), "r_telephone_no" varchar(15), "p_address" varchar(70), "p_zip_code" varchar(5), "p_telephone_no" varchar(15), "email_address" varchar(40), "cellphone_no" varchar(15), "agency_employee_no" varchar(20), "tin" varchar(15), "academic_ranking_id" integer, "hired_date" date, "picture_file_name" varchar, "picture_content_type" varchar, "picture_file_size" integer, "picture_updated_at" datetime);
CREATE TABLE "leaves" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "filed_at" date NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "length" integer NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "nbcs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "is_current" integer DEFAULT 0 NOT NULL);
CREATE TABLE "rating_periods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" integer NOT NULL, "end_at" integer NOT NULL, "semester" integer(1) NOT NULL, "status" integer DEFAULT 1 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "account_id" integer, "account_type" varchar);
CREATE UNIQUE INDEX "index_admins_on_username" ON "admins" ("username");
CREATE INDEX "index_employee_civil_service_eligibilities_on_employee_id" ON "employee_civil_service_eligibilities" ("employee_id");
CREATE INDEX "index_employee_educations_on_employee_id" ON "employee_educations" ("employee_id");
CREATE INDEX "index_employee_other_infos_on_employee_id" ON "employee_other_infos" ("employee_id");
CREATE INDEX "index_employee_rankings_on_employee_id" ON "employee_rankings" ("employee_id");
CREATE INDEX "index_employee_rankings_on_nbc_id" ON "employee_rankings" ("nbc_id");
CREATE INDEX "index_employee_ratings_on_employee_id" ON "employee_ratings" ("employee_id");
CREATE INDEX "index_employee_ratings_on_rating_period_id" ON "employee_ratings" ("rating_period_id");
CREATE INDEX "index_employee_trainings_on_employee_id" ON "employee_trainings" ("employee_id");
CREATE INDEX "index_employee_voluntary_works_on_employee_id" ON "employee_voluntary_works" ("employee_id");
CREATE INDEX "index_employee_work_experiences_on_employee_id" ON "employee_work_experiences" ("employee_id");
CREATE INDEX "index_employees_on_academic_ranking_id" ON "employees" ("academic_ranking_id");
CREATE INDEX "index_leaves_on_employee_id" ON "leaves" ("employee_id");
CREATE INDEX "index_users_on_account_type_and_account_id" ON "users" ("account_type", "account_id");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20160204155716');

INSERT INTO schema_migrations (version) VALUES ('20160204160233');

INSERT INTO schema_migrations (version) VALUES ('20160205231500');

INSERT INTO schema_migrations (version) VALUES ('20160206014353');

INSERT INTO schema_migrations (version) VALUES ('20160207171949');

INSERT INTO schema_migrations (version) VALUES ('20160207183919');

INSERT INTO schema_migrations (version) VALUES ('20160210001648');

INSERT INTO schema_migrations (version) VALUES ('20160217143531');

INSERT INTO schema_migrations (version) VALUES ('20160226090504');

INSERT INTO schema_migrations (version) VALUES ('20160228034522');

INSERT INTO schema_migrations (version) VALUES ('20160301055442');

INSERT INTO schema_migrations (version) VALUES ('20160306101228');

INSERT INTO schema_migrations (version) VALUES ('20160308075544');

INSERT INTO schema_migrations (version) VALUES ('20160312055110');

INSERT INTO schema_migrations (version) VALUES ('20160313013129');

INSERT INTO schema_migrations (version) VALUES ('20160313074855');

INSERT INTO schema_migrations (version) VALUES ('20160313075103');

INSERT INTO schema_migrations (version) VALUES ('20160313081713');

INSERT INTO schema_migrations (version) VALUES ('20160313085743');

INSERT INTO schema_migrations (version) VALUES ('20160313090335');

INSERT INTO schema_migrations (version) VALUES ('20160313204433');

INSERT INTO schema_migrations (version) VALUES ('20160314084343');

INSERT INTO schema_migrations (version) VALUES ('20160315005106');

INSERT INTO schema_migrations (version) VALUES ('20160315005616');

INSERT INTO schema_migrations (version) VALUES ('20160315194405');

INSERT INTO schema_migrations (version) VALUES ('20160315194614');

INSERT INTO schema_migrations (version) VALUES ('20160317185507');

INSERT INTO schema_migrations (version) VALUES ('20160317190452');

INSERT INTO schema_migrations (version) VALUES ('20160322124936');

INSERT INTO schema_migrations (version) VALUES ('20160322232528');

INSERT INTO schema_migrations (version) VALUES ('20160323054840');

INSERT INTO schema_migrations (version) VALUES ('20160323182809');

INSERT INTO schema_migrations (version) VALUES ('20160325062920');

INSERT INTO schema_migrations (version) VALUES ('20160325100902');

INSERT INTO schema_migrations (version) VALUES ('20160325101249');

INSERT INTO schema_migrations (version) VALUES ('20160326173802');

INSERT INTO schema_migrations (version) VALUES ('20160327150345');

INSERT INTO schema_migrations (version) VALUES ('20160327151838');

INSERT INTO schema_migrations (version) VALUES ('20160327164558');

INSERT INTO schema_migrations (version) VALUES ('20160327174409');

INSERT INTO schema_migrations (version) VALUES ('20160327220144');