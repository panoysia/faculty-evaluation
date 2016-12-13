CREATE TABLE "academic_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "subrank" integer, "position" integer(1) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "cce_min_points" integer, "cce_max_points" integer, "qce_min_points" integer, "qce_max_points" integer, "salary_grade" integer);
CREATE TABLE "academic_years" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "nbc_id" integer);
CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "career_path_actions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "start_at" date, "end_at" date, "description" varchar, "category" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "company" varchar, "specialization_id" integer NOT NULL);
CREATE TABLE "career_paths" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "description" varchar(30), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "creative_work_criteria" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "departments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(40) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "discovery_criteria" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "criteria" integer NOT NULL);
CREATE TABLE "employee_academic_advisories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "title" varchar(150) NOT NULL, "nature" integer NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_academic_degrees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "institution" varchar(50) NOT NULL, "degree" varchar(50) NOT NULL, "degree_type" integer NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "graduated_at" date, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_academic_honors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "award" varchar(150) NOT NULL, "degree_type" integer NOT NULL, "honor_type" integer NOT NULL, "school" varchar(150) NOT NULL, "date_awarded" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_academic_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "position" varchar(50) NOT NULL, "institution" varchar(75) NOT NULL, "institution_type" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_accreditation_services" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "name" varchar(150) NOT NULL, "participation" varchar(150) DEFAULT '' NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "agency" varchar(150) DEFAULT '' NOT NULL);
CREATE TABLE "employee_additional_credits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "institution" varchar(50) NOT NULL, "degree" varchar(50) NOT NULL, "no_of_units" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "degree_type" integer DEFAULT 1 NOT NULL);
CREATE TABLE "employee_additional_degrees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "institution" varchar(50) NOT NULL, "degree" varchar(50) NOT NULL, "degree_type" integer NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "graduated_at" date, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_admin_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "position" integer NOT NULL, "institution" varchar(75) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_assessor_services" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "name" varchar(150) NOT NULL, "agency" varchar(150) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_awards" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "name" varchar(150) NOT NULL, "level" integer NOT NULL, "date_awarded" date NOT NULL, "description" varchar(150) DEFAULT '' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_cce_scorings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "cce_scorable_id" integer NOT NULL, "cce_scorable_type" varchar NOT NULL, "nbc_id" integer, "points" decimal(5,2) NOT NULL, "supporting_description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_civil_service_eligibilities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "career_service" varchar(30) NOT NULL, "rating" float(24) NOT NULL, "date_of_exam" date NOT NULL, "place_of_exam" varchar(50), "license_number" varchar(15), "date_release_of_license" date, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_community_outreaches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "project_name" varchar(150) NOT NULL, "sponsoring_agency" varchar(150) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "employee_id" integer NOT NULL, "participation" varchar(100) DEFAULT '' NOT NULL);
CREATE TABLE "employee_consultancy_services" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "title" varchar(150), "level" integer NOT NULL, "nature_of_participation" varchar(150) DEFAULT '' NOT NULL, "sponsoring_agency" varchar(150) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_creative_works" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "patent_no" varchar NOT NULL, "year_patented" integer NOT NULL, "description" varchar(150), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar NOT NULL, "competitiveness" integer NOT NULL);
CREATE TABLE "employee_creative_works_criteria" ("employee_creative_work_id" integer NOT NULL, "creative_work_criterium_id" integer NOT NULL);
CREATE TABLE "employee_discoveries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "patent_no" varchar NOT NULL, "year_patented" integer NOT NULL, "description" varchar(150), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar NOT NULL);
CREATE TABLE "employee_discoveries_criteria" ("employee_discovery_id" integer NOT NULL, "discovery_criterium_id" integer NOT NULL);
CREATE TABLE "employee_educations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "level" integer(1) NOT NULL, "school_name" varchar(50) NOT NULL, "degree_course" varchar(50) NOT NULL, "grade_units" integer(7), "graduated_at" date, "start_at" date, "end_at" date, "honors_received" text(65535), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "attainment_level" integer, "criteria" integer);
CREATE TABLE "employee_evaluations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "nbc_id" integer NOT NULL, "current_rank" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rank_before" varchar DEFAULT '' NOT NULL, "rank_after" varchar DEFAULT '' NOT NULL, "cce_score" decimal(5,2) DEFAULT 0.0 NOT NULL, "qce_score" decimal(5,2) DEFAULT 0.0 NOT NULL);
CREATE TABLE "employee_innovations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "patent_no" varchar NOT NULL, "year_patented" integer NOT NULL, "description" varchar(150), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "employee_id" integer NOT NULL, "name" varchar NOT NULL, "competitiveness" integer NOT NULL);
CREATE TABLE "employee_innovations_criteria" ("employee_innovation_id" integer NOT NULL, "innovation_criterium_id" integer NOT NULL);
CREATE TABLE "employee_instructional_manuals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "published_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "category" integer, "employee_id" integer NOT NULL, "description" varchar(150) DEFAULT '' NOT NULL);
CREATE TABLE "employee_inventions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "patent_no" varchar NOT NULL, "year_patented" integer NOT NULL, "description" varchar(150), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "patent_type" integer NOT NULL, "name" varchar NOT NULL);
CREATE TABLE "employee_other_infos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "context" integer(1) NOT NULL, "info" varchar(100) NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_professional_examinations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(150) NOT NULL, "agency_name" varchar(150) NOT NULL, "date_passed" date NOT NULL, "category" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "employee_id" integer NOT NULL);
CREATE TABLE "employee_professional_memberships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "organization" varchar(150) NOT NULL, "date_of_membership" date NOT NULL, "organization_type" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "membership_type" integer);
CREATE TABLE "employee_professional_reviews" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "name" varchar(150) NOT NULL, "occurred_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "review_type" integer NOT NULL);
CREATE TABLE "employee_professional_services" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "title" varchar(150), "service_type" integer NOT NULL, "level" integer NOT NULL, "nature_of_participation" varchar(150) DEFAULT '' NOT NULL, "sponsoring_agency" varchar(150) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_professional_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "position" integer NOT NULL, "institution" varchar(75) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_public_private_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "position" integer NOT NULL, "institution" varchar(75) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_publications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar NOT NULL, "role" integer NOT NULL, "academic_level" integer NOT NULL, "publisher" varchar, "date_of_publication" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "employee_id" integer NOT NULL, "description" varchar(150) DEFAULT '' NOT NULL);
CREATE TABLE "employee_rankings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer, "nbc_id" integer, "cce_total_points" integer NOT NULL, "qce_total_points" integer NOT NULL, "current_rank" varchar NOT NULL, "achieved_rank" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_scholarships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "title" varchar(150) NOT NULL, "sponsoring_agency" varchar(150) NOT NULL, "date_granted" date NOT NULL, "scholarship_type" integer NOT NULL, "degree_type" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_technical_articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50) NOT NULL, "level" integer NOT NULL, "published_at" date NOT NULL, "description" varchar(150), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "employee_id" integer NOT NULL);
CREATE TABLE "employee_trainer_services" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "name" varchar(150) NOT NULL, "agency" varchar(150) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_trainings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(100) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "no_of_days" integer(2) DEFAULT 0, "conducted_by" varchar(50) NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "level" integer NOT NULL, "nature_of_participation" varchar DEFAULT '' NOT NULL, "category" integer NOT NULL);
CREATE TABLE "employee_voluntary_works" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "organization" varchar(70) NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "no_of_hours" integer(2), "position" varchar(50), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employee_work_experiences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "position_title" varchar(50) NOT NULL, "company" varchar(50) NOT NULL, "monthly_salary" decimal(10), "salary_grade" varchar(7), "status_of_appointment" varchar(20), "is_gov_service" integer(1), "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "middle_name" varchar(50), "name_extension" varchar(7), "designation" varchar, "gender" varchar(1), "civil_status" varchar(3), "birth_date" date, "citizenship" varchar(15), "height" varchar(5), "weight" varchar(15), "blood_type" varchar(3), "gsis_no" varchar(20), "pagibig_no" varchar(20), "philhealth_no" varchar(20), "sss_no" varchar(15), "r_address" varchar(70), "r_zip_code" varchar(5), "r_telephone_no" varchar(15), "p_address" varchar(70), "p_zip_code" varchar(5), "p_telephone_no" varchar(15), "email_address" varchar(40), "cellphone_no" varchar(15), "agency_employee_no" varchar(20), "tin" varchar(15), "academic_ranking_id" integer, "hired_date" date, "picture_file_name" varchar, "picture_content_type" varchar, "picture_file_size" integer, "picture_updated_at" datetime, "specialization_id" integer, "department_id" integer, "faculty_no" varchar DEFAULT '' NOT NULL);
CREATE TABLE "holidays" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "occurs_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "is_weekend" integer DEFAULT 0 NOT NULL);
CREATE TABLE "innovation_criteria" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "leave_service_credits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "description" varchar, "valid_at" date NOT NULL, "expire_at" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "academic_year_id" integer, "no_of_days" integer);
CREATE TABLE "leaves" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "filed_at" date NOT NULL, "start_at" date NOT NULL, "end_at" date NOT NULL, "length" integer NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "academic_year_id" integer);
CREATE TABLE "nbcs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "status" integer DEFAULT 1 NOT NULL);
CREATE TABLE "qce_questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question" varchar NOT NULL, "sequence" integer NOT NULL, "rating_type" varchar NOT NULL, "instrument" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_rating_evaluations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question_id" integer NOT NULL, "score" integer DEFAULT 0, "rating_id" integer NOT NULL, "rating_type" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_rating_tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "evaluator_id" integer NOT NULL, "evaluator_type" varchar NOT NULL, "rating_id" integer NOT NULL, "rating_type" varchar NOT NULL, "status" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "qce_ratings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "qce_id" integer NOT NULL, "type" varchar NOT NULL, "evaluator_id" integer NOT NULL, "evaluator_type" varchar NOT NULL, "evaluator_name" varchar, "evaluator_position" varchar, "evaluation_context" varchar, "finished_at" date, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "instrument" varchar);
CREATE TABLE "qces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "employee_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rating_period_id" integer NOT NULL, "completed" integer DEFAULT 0 NOT NULL, "has_assigned_self_rating" integer, "has_assigned_supervisor_rating" integer, "has_assigned_peer_rating" integer, "has_assigned_student_rating" integer, "support_area" varchar);
CREATE TABLE "rating_periods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "semester" integer(1) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "nbc_id" integer, "academic_year_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE TABLE "specializations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "career_path_id" integer NOT NULL, "is_generalize" integer DEFAULT 0);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(50) NOT NULL, "last_name" varchar(50) NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "department_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(20) NOT NULL, "password_digest" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "account_id" integer, "account_type" varchar);
CREATE INDEX "idx_cce_scorable_on_employee_cce_scorings" ON "employee_cce_scorings" ("cce_scorable_type", "cce_scorable_id");
CREATE INDEX "idx_ecwc_on_creative_work_criterium_id" ON "employee_creative_works_criteria" ("creative_work_criterium_id");
CREATE INDEX "idx_ecwc_on_employee_creative_work_id" ON "employee_creative_works_criteria" ("employee_creative_work_id");
CREATE INDEX "idx_edc_on_discovery_criterium_id" ON "employee_discoveries_criteria" ("discovery_criterium_id");
CREATE INDEX "idx_edc_on_employee_discovery_id" ON "employee_discoveries_criteria" ("employee_discovery_id");
CREATE INDEX "idx_eic_on_employee_innovation_id" ON "employee_innovations_criteria" ("employee_innovation_id");
CREATE INDEX "idx_eic_on_innovation_criterium_id" ON "employee_innovations_criteria" ("innovation_criterium_id");
CREATE INDEX "idx_emp_innovations_on_emp_id" ON "employee_innovations" ("employee_id");
CREATE INDEX "idx_emp_instructioinal_manuals_on_emp_id" ON "employee_instructional_manuals" ("employee_id");
CREATE INDEX "idx_emp_publications_on_emp_id" ON "employee_publications" ("employee_id");
CREATE INDEX "idx_emp_technical_articles_on_emp_id" ON "employee_technical_articles" ("employee_id");
CREATE INDEX "idx_employee_id_on_employee_cce_scorings" ON "employee_cce_scorings" ("employee_id");
CREATE INDEX "idx_nbc_id_on_employee_cce_scorings" ON "employee_cce_scorings" ("nbc_id");
CREATE INDEX "index_academic_years_on_nbc_id" ON "academic_years" ("nbc_id");
CREATE UNIQUE INDEX "index_admins_on_username" ON "admins" ("username");
CREATE INDEX "index_career_path_actions_on_specialization_id" ON "career_path_actions" ("specialization_id");
CREATE UNIQUE INDEX "index_career_paths_on_name" ON "career_paths" ("name");
CREATE UNIQUE INDEX "index_departments_on_name" ON "departments" ("name");
CREATE INDEX "index_employee_academic_advisories_on_employee_id" ON "employee_academic_advisories" ("employee_id");
CREATE INDEX "index_employee_academic_degrees_on_employee_id" ON "employee_academic_degrees" ("employee_id");
CREATE INDEX "index_employee_academic_honors_on_employee_id" ON "employee_academic_honors" ("employee_id");
CREATE INDEX "index_employee_academic_work_experiences_on_employee_id" ON "employee_academic_work_experiences" ("employee_id");
CREATE INDEX "index_employee_accreditation_services_on_employee_id" ON "employee_accreditation_services" ("employee_id");
CREATE INDEX "index_employee_additional_credits_on_employee_id" ON "employee_additional_credits" ("employee_id");
CREATE INDEX "index_employee_additional_degrees_on_employee_id" ON "employee_additional_degrees" ("employee_id");
CREATE INDEX "index_employee_admin_work_experiences_on_employee_id" ON "employee_admin_work_experiences" ("employee_id");
CREATE INDEX "index_employee_assessor_services_on_employee_id" ON "employee_assessor_services" ("employee_id");
CREATE INDEX "index_employee_awards_on_employee_id" ON "employee_awards" ("employee_id");
CREATE INDEX "index_employee_civil_service_eligibilities_on_employee_id" ON "employee_civil_service_eligibilities" ("employee_id");
CREATE INDEX "index_employee_community_outreaches_on_employee_id" ON "employee_community_outreaches" ("employee_id");
CREATE INDEX "index_employee_consultancy_services_on_employee_id" ON "employee_consultancy_services" ("employee_id");
CREATE INDEX "index_employee_creative_works_on_employee_id" ON "employee_creative_works" ("employee_id");
CREATE INDEX "index_employee_discoveries_on_employee_id" ON "employee_discoveries" ("employee_id");
CREATE INDEX "index_employee_educations_on_attainment_level" ON "employee_educations" ("attainment_level");
CREATE INDEX "index_employee_educations_on_criteria" ON "employee_educations" ("criteria");
CREATE INDEX "index_employee_educations_on_employee_id" ON "employee_educations" ("employee_id");
CREATE INDEX "index_employee_evaluations_on_employee_id" ON "employee_evaluations" ("employee_id");
CREATE INDEX "index_employee_evaluations_on_nbc_id" ON "employee_evaluations" ("nbc_id");
CREATE INDEX "index_employee_inventions_on_employee_id" ON "employee_inventions" ("employee_id");
CREATE INDEX "index_employee_other_infos_on_employee_id" ON "employee_other_infos" ("employee_id");
CREATE INDEX "index_employee_professional_examinations_on_employee_id" ON "employee_professional_examinations" ("employee_id");
CREATE INDEX "index_employee_professional_memberships_on_employee_id" ON "employee_professional_memberships" ("employee_id");
CREATE INDEX "index_employee_professional_reviews_on_employee_id" ON "employee_professional_reviews" ("employee_id");
CREATE INDEX "index_employee_professional_services_on_employee_id" ON "employee_professional_services" ("employee_id");
CREATE INDEX "index_employee_professional_work_experiences_on_employee_id" ON "employee_professional_work_experiences" ("employee_id");
CREATE INDEX "index_employee_public_private_work_experiences_on_employee_id" ON "employee_public_private_work_experiences" ("employee_id");
CREATE INDEX "index_employee_rankings_on_employee_id" ON "employee_rankings" ("employee_id");
CREATE INDEX "index_employee_rankings_on_nbc_id" ON "employee_rankings" ("nbc_id");
CREATE INDEX "index_employee_scholarships_on_employee_id" ON "employee_scholarships" ("employee_id");
CREATE INDEX "index_employee_trainer_services_on_employee_id" ON "employee_trainer_services" ("employee_id");
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
CREATE INDEX "index_students_on_department_id" ON "students" ("department_id");
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

INSERT INTO schema_migrations (version) VALUES ('20160610082656');

INSERT INTO schema_migrations (version) VALUES ('20160610085429');

INSERT INTO schema_migrations (version) VALUES ('20160610185536');

INSERT INTO schema_migrations (version) VALUES ('20160610185744');

INSERT INTO schema_migrations (version) VALUES ('20160613052947');

INSERT INTO schema_migrations (version) VALUES ('20160614054604');

INSERT INTO schema_migrations (version) VALUES ('20160620075439');

INSERT INTO schema_migrations (version) VALUES ('20160620082115');

INSERT INTO schema_migrations (version) VALUES ('20160620083943');

INSERT INTO schema_migrations (version) VALUES ('20160621051626');

INSERT INTO schema_migrations (version) VALUES ('20160627175220');

INSERT INTO schema_migrations (version) VALUES ('20160722074306');

INSERT INTO schema_migrations (version) VALUES ('20160722194144');

INSERT INTO schema_migrations (version) VALUES ('20160723192735');

INSERT INTO schema_migrations (version) VALUES ('20160723195811');

INSERT INTO schema_migrations (version) VALUES ('20160724204725');

INSERT INTO schema_migrations (version) VALUES ('20160724205020');

INSERT INTO schema_migrations (version) VALUES ('20160724205230');

INSERT INTO schema_migrations (version) VALUES ('20160724205332');

INSERT INTO schema_migrations (version) VALUES ('20160728205838');

INSERT INTO schema_migrations (version) VALUES ('20160729192129');

INSERT INTO schema_migrations (version) VALUES ('20160730190049');

INSERT INTO schema_migrations (version) VALUES ('20160730190715');

INSERT INTO schema_migrations (version) VALUES ('20160730194445');

INSERT INTO schema_migrations (version) VALUES ('20160730205603');

INSERT INTO schema_migrations (version) VALUES ('20160801000626');

INSERT INTO schema_migrations (version) VALUES ('20160801005215');

INSERT INTO schema_migrations (version) VALUES ('20160801180214');

INSERT INTO schema_migrations (version) VALUES ('20160801181750');

INSERT INTO schema_migrations (version) VALUES ('20160801182634');

INSERT INTO schema_migrations (version) VALUES ('20160801182941');

INSERT INTO schema_migrations (version) VALUES ('20160801183825');

INSERT INTO schema_migrations (version) VALUES ('20160801184120');

INSERT INTO schema_migrations (version) VALUES ('20160801184639');

INSERT INTO schema_migrations (version) VALUES ('20160802184027');

INSERT INTO schema_migrations (version) VALUES ('20160802184416');

INSERT INTO schema_migrations (version) VALUES ('20160802201137');

INSERT INTO schema_migrations (version) VALUES ('20160802204505');

INSERT INTO schema_migrations (version) VALUES ('20160803020158');

INSERT INTO schema_migrations (version) VALUES ('20160803021859');

INSERT INTO schema_migrations (version) VALUES ('20160804051959');

INSERT INTO schema_migrations (version) VALUES ('20160804083530');

INSERT INTO schema_migrations (version) VALUES ('20160804085340');

INSERT INTO schema_migrations (version) VALUES ('20160804125237');

INSERT INTO schema_migrations (version) VALUES ('20160804183728');

INSERT INTO schema_migrations (version) VALUES ('20160804204146');

INSERT INTO schema_migrations (version) VALUES ('20160804205828');

INSERT INTO schema_migrations (version) VALUES ('20160808024751');

INSERT INTO schema_migrations (version) VALUES ('20160808050811');

INSERT INTO schema_migrations (version) VALUES ('20160808054245');

INSERT INTO schema_migrations (version) VALUES ('20160808055245');

INSERT INTO schema_migrations (version) VALUES ('20160808055536');

INSERT INTO schema_migrations (version) VALUES ('20160808070529');

INSERT INTO schema_migrations (version) VALUES ('20160808074931');

INSERT INTO schema_migrations (version) VALUES ('20160808124437');

INSERT INTO schema_migrations (version) VALUES ('20160809064729');

INSERT INTO schema_migrations (version) VALUES ('20160809073526');

INSERT INTO schema_migrations (version) VALUES ('20160828142540');

INSERT INTO schema_migrations (version) VALUES ('20160830111743');

INSERT INTO schema_migrations (version) VALUES ('20160830112734');

INSERT INTO schema_migrations (version) VALUES ('20160906192008');

INSERT INTO schema_migrations (version) VALUES ('20160907035806');

INSERT INTO schema_migrations (version) VALUES ('20160907060716');

INSERT INTO schema_migrations (version) VALUES ('20160907070639');

INSERT INTO schema_migrations (version) VALUES ('20160910214652');

INSERT INTO schema_migrations (version) VALUES ('20160920175728');

INSERT INTO schema_migrations (version) VALUES ('20160922062827');

INSERT INTO schema_migrations (version) VALUES ('20160922154407');

INSERT INTO schema_migrations (version) VALUES ('20160924120201');

INSERT INTO schema_migrations (version) VALUES ('20160925022930');

INSERT INTO schema_migrations (version) VALUES ('20161002173845');

INSERT INTO schema_migrations (version) VALUES ('20161004070222');

INSERT INTO schema_migrations (version) VALUES ('20161005202702');

INSERT INTO schema_migrations (version) VALUES ('20161006120355');

INSERT INTO schema_migrations (version) VALUES ('20161009002014');

INSERT INTO schema_migrations (version) VALUES ('20161009103527');

INSERT INTO schema_migrations (version) VALUES ('20161012081610');

INSERT INTO schema_migrations (version) VALUES ('20161013095625');

INSERT INTO schema_migrations (version) VALUES ('20161018224545');

INSERT INTO schema_migrations (version) VALUES ('20161019190942');

