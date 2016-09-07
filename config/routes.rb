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
    get 'faculty-evaluation' => "faculty_evaluation_searches#index", as: :faculty_evaluation_search

    #get 'leaves/view' => "leave_viewings#index"
    #get 'leaves/search' => "leave_searches#index"
    #get 'leave_service_credits/search' => "leave_service_credits#index"

    # resources :faculty_evaluations, path: 'faculty-evaluation'

    resource :dashboard, only: :show

    resources :nbcs do
      member do
        patch 'close'
        patch 'open'
        
        get 'associate-academic-years'
        patch 'update-academic-years'
        patch 'remove_academic_years_association'
      end
    end

    resources :qces
    resources :cces

    # Just to make use of 'qce' for path, i.e., could have used path scope instead
    # namespace :qce do
    #   resources :questions, only: :index
    # end

    resources :employees do
      scope module: :employees do
        resource :career_path, only: :show
        resources :qces, only: [:index, :show]
        resources :leaves

        # "Educations (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :educations, only: :index
          resources :academic_degrees, except: [:index, :show]
          resources :additional_degrees, except: [:index, :show]
          resources :additional_credits, except: [:index, :show]

        # "Work Experiences (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :work_experiences, only: :index
          resources :academic_work_experiences, except: [:index, :show]
          resources :admin_work_experiences, except: [:index, :show]

          # 6 employee_professional_work_experiences (professional/technical)
          # 7 employee_public_private_work_experiences

        # "Achievement and Honors (tabs 1 & 2)" and resources under it 
        #   (should be namespaced instead)
        resource :achievement_and_honors_1, only: :show
          resources :creative_works, except: [:index, :show]
          resources :discoveries, except: [:index, :show]
          resources :innovations, except: [:index, :show]
          resources :instructional_manuals, except: [:index, :show]
          resources :inventions, except: [:index, :show]
          resources :publications, except: [:index, :show]
          resources :technical_articles, except: [:index, :show]
                  
        resource :achievement_and_honors_2, only: :show
          resources :academic_honors, except: [:index, :show]
          resources :awards, except: [:index, :show]
          resources :community_outreaches, except: [:index, :show]
          resources :professional_examinations, except: [:index, :show]
          resources :professional_memberships, except: [:index, :show]
          resources :scholarships, except: [:index, :show]

        # "Expert Services (tab)" and resources under it 
        #   (should be namespaced instead)
        resources :expert_services, only: :index
          resources :academic_advisories, except: [:index, :show]
          resources :accreditation_services, except: [:index, :show]
          resources :assessor_services, except: [:index, :show]          
          resources :professional_reviews, except: [:index, :show]
          resources :professional_services, except: [:index, :show]
          resources :trainer_services, except: [:index, :show]

        resources :trainings

        resources :cce_scorings, only: :index
        resources :rankings

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
    resources :clients

    resource :account, only: [:edit, :update]
  end   # namespace :admin

  scope module: :user do
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'login' => 'sessions#create', as: :authenticate_user

    resource :dashboard, only: :show
    resource :hr_profile, only: :show, path: 'my-hr-profile'
    resource :career_path, only: :show, path: 'my-career-path'
    resource :account, only: [:edit, :update], path: 'user-account', as: :user_account

    resources :leaves, only: [:index, :show]
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