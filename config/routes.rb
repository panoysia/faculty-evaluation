Rails.application.routes.draw do

  post 'admin/login' => 'admin/sessions#create', as: :authenticate_admin

  namespace :admin do    
    # root to: redirect('admin/dashboard')
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'

    get 'faculty/search' => "employee_searches#index"
    get 'faculty/query' => "employee_queries#index"
    get 'faculty-career-pathing' => "employee_career_pathings#index"

    # get "faculty-evaluation/search" =>
    #   "search_employee_evaluations#index"
    resources :search_employee_evaluations,
      path: "faculty-evaluation/search", only: :index

    #get 'leaves/view' => "leave_viewings#index"
    #get 'leaves/search' => "leave_searches#index"
    #get 'leave_service_credits/search' => "leave_service_credits#index"

    resource :dashboard, only: :show
    resources :test_rankings, only: [:index, :show]

    resources :nbcs do
      member do
        patch 'close'
        patch 'open'
        
        get 'associate-academic-years'
        patch 'update-academic-years'
        patch 'remove_academic_years_association'
      end
    end

    resources :employees do
      scope module: :employees do
        resource :cce_record, only: :show
        resource :career_path, only: :show

        resources :evaluations,
          only: [:index, :show, :new, :create]
          
        resources :qces, only: [:index, :show] do
          scope module: :qces do
            rating_types = [:instructions, :extensions,
                                :productions, :researches]

            resources *rating_types, only: :show

            # QCE Summary Sheet for Teaching Effectiveness by Evaluator Type
            resource :instruction_summary_sheet, only: :show,
              path: 'instruction-summary-sheet-by-evaluator-type'

            # QCE Summary Sheet for Research, Extension, Production by Evaluator Type
            resource :support_area_summary_sheet, only: :show,
              path: 'support-area-summary-sheet-by-evaluator-type'

            # Computation of Summary of Rating Per Semester
            resource :computation_summary_rating, only: :show,
              path: 'computation-of-summary-rating-per-semester'

            # QCE Computation of the Summary of Rating for the Whole Evaluation Period
            # (Summary Sheet for Whole Evaluation Period)
            # resource :whole_evaluation_period_summary_sheet
          end   # scope module: :qces
        end   # resources :qces

        resources :leaves, except: :show
        resources :leave_service_credits, except: [:index, :show]

        # "Educations (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :educations, only: :index
          resources :academic_degrees, except: [:index, :show]
          resources :additional_degrees, except: [:index, :show]
          resources :additional_credits, except: [:index, :show]
          resources :trainings, except: [:index, :show]

        # "Work Experiences (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :work_experiences, only: :index
          resources :academic_work_experiences, except: [:index, :show]
          resources :admin_work_experiences, except: [:index, :show]
          resources :professional_work_experiences,
            except: [:index, :show]
          resources :public_private_work_experiences,
            except: [:index, :show]

        # "Achievement and Honors (tabs 1 & 2)" and resources under it 
        #   (should be namespaced instead)
        resource :achievement_and_honors_1, only: :show,
          path: "discoveries-and-creative-works"

          resources :creative_works, except: [:index, :show]
          resources :discoveries, except: [:index, :show]
          resources :innovations, except: [:index, :show]
          resources :instructional_manuals, except: [:index, :show]
          resources :inventions, except: [:index, :show]
          resources :publications, except: [:index, :show]
          resources :technical_articles, except: [:index, :show]
                  
        resource :achievement_and_honors_2, only: :show,
          path: "achievement-and-honors"

          resources :academic_honors, except: [:index, :show]
          resources :awards, except: [:index, :show]
          resources :community_outreaches, except: [:index, :show]
          resources :professional_examinations, except: [:index, :show]
          resources :professional_memberships, except: [:index, :show]
          resources :scholarships, except: [:index, :show]

        # "Expert Services (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :expert_services, only: :index,
          path: "expert-services"

          resources :academic_advisories, except: [:index, :show]
          resources :accreditation_services, except: [:index, :show]
          resources :assessor_services, except: [:index, :show]
          resources :professional_reviews, except: [:index, :show]
          resources :professional_services, except: [:index, :show]
          resources :consultancy_services, except: [:index, :show]
          resources :trainer_services, except: [:index, :show]
    
        # TODO: Delete all files related to these resources:
          # resources :rankings
          # resources :civil_service_eligibilities
          # resources :other_infos
          # resources :voluntary_works
      end
    end   # resources :employees

    resources :departments
    resources :leaves
    resources :leave_service_credits
    resources :holidays

    resources :career_paths
    resources :specializations
    resources :career_path_actions
    
    resources :academic_years, path: 'academic-years'
    # resources :rating_periods, path: 'rating-periods'
    resources :academic_rankings, only: :index, path: 'academic-rankings'

    resources :admins
    resources :users
    resources :students
    # resources :clients

    resource :account, only: [:edit, :update]
  end   # namespace :admin

  scope module: :user do
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'login' => 'sessions#create', as: :authenticate_user

    resource :dashboard, only: :show

    resource :hr_profile, only: :show, path: 'my-hr-profile' do
      patch "personal_info", action: "update_personal_info"
      patch "gov_membership_info", action: "update_gov_membership_info"
      patch "addresses_info", action: "update_addresses_info"
    end

    resource :career_path, only: :show, path: 'my-career-path'

    resource :cce_record, only: :show
    scope path: "cce_record", module: :cce_record do
      resources :academic_degrees, except: [:index, :show]
      resources :additional_degrees, except: [:index, :show]
      resources :additional_credits, except: [:index, :show]
      resources :trainings, except: [:index, :show]

      resources :academic_work_experiences, except: [:index, :show]
      resources :admin_work_experiences, except: [:index, :show]
      resources :professional_work_experiences, except: [:index, :show]
      resources :public_private_work_experiences, except: [:index, :show]

      resources :creative_works, except: [:index, :show]
      resources :discoveries, except: [:index, :show]
      resources :innovations, except: [:index, :show]
      resources :instructional_manuals, except: [:index, :show]
      resources :inventions, except: [:index, :show]
      resources :publications, except: [:index, :show]
      resources :technical_articles, except: [:index, :show]

      resources :academic_honors, except: [:index, :show]
      resources :awards, except: [:index, :show]
      resources :community_outreaches, except: [:index, :show]
      resources :professional_examinations, except: [:index, :show]
      resources :professional_memberships, except: [:index, :show]
      resources :scholarships, except: [:index, :show]

      resources :academic_advisories, except: [:index, :show]
      resources :accreditation_services, except: [:index, :show]
      resources :assessor_services, except: [:index, :show]
      resources :professional_reviews, except: [:index, :show]
      resources :professional_services, except: [:index, :show]
      resources :consultancy_services, except: [:index, :show]
      resources :trainer_services, except: [:index, :show]
    end

    resource :account, only: [:edit, :update], path: 'user-account',
              as: :user_account

    resources :leaves, only: :index
    resources :rating_tasks, only: :index

    resources :qces, except: :new do
      member do
        delete 'support_area' => 'qces#destroy_support_area'
        patch 'finalize' => 'qces#finalize'
      end

      scope module: :qces do
        # Should have been an object that manages adding these different type of QCE::InstructionRating
        resource :self_instruction_rating, only: [:create, :destroy]
        # class User::QCEs::SelfInstructionRatingsController

        resource :supervisor_instruction_rating, only: [:create, :destroy]
        resource :peer_instruction_rating, only: [:create, :destroy]
        resource :student_instruction_rating, only: [:create, :destroy]

        resource :clientele_instrument, only: [:create, :destroy]
        resource :leadership_instrument, only: [:create, :destroy]
        resource :partnership_instrument, only: [:create, :destroy]
        resource :community_instrument, only: [:create, :destroy]

        rating_types = [:instructions, :extensions,
                            :productions, :researches]
        rating_actions = [:show, :edit, :update]
        custom_path_names = { edit: :evaluate }

        resources *rating_types, only: rating_actions,
                                  path_names: custom_path_names do
          member do
            patch 'randomize_save'
          end
        end

        # QCE Summary Sheet for Teaching Effectiveness by Evaluator Type
        resource :instruction_summary_sheet, only: :show,
          path: 'instruction-summary-sheet-by-evaluator-type'

        # QCE Summary Sheet for Research, Extension, Production by Evaluator Type
        resource :support_area_summary_sheet, only: :show,
          path: 'support-area-summary-sheet-by-evaluator-type'

        # Computation of Summary of Rating Per Semester
        resource :computation_summary_rating, only: :show,
          path: 'computation-of-summary-rating-per-semester'

        # QCE Computation of the Summary of Rating for the Whole Evaluation Period
        # (Summary Sheet for Whole Evaluation Period)
        # resource :whole_evaluation_period_summary_sheet

      end   # scope module: :qces
    end   # resources :qces
  end   # scope module: :user

end   # Rails.application.routes.draw do

# scope module: :evaluations do      
#     resources :instruction_ratings,
#       module: :qce,
#       only: [:edit, :update],
#       path: 'evaluate/instruction_ratings',
#       path_names: { edit:  'evaluate' },
#       as: 'evaluate_qce_instruction_rating'
# end
