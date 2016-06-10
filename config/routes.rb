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

    #get 'leaves/view' => "leave_viewings#index"
    #get 'leaves/search' => "leave_searches#index"
    #get 'leave_service_credits/search' => "leave_service_credits#index"

    resource :dashboard, only: [:show]

    resources :nbcs do
      member do
        get 'associate-academic-years'
        patch 'update-academic-years'
        delete 'remove_academic_years_association'
      end
    end

    resources :qces
    resources :cces

    # Just to make use of 'qce' for path, i.e., could have used path scope instead
    namespace :qce do
      resources :questions, only: [:index]
    end

    resources :employees do
      scope module: :employees do
        resources :educations
        resources :trainings
        resources :civil_service_eligibilities
        resources :other_infos
        resources :voluntary_works
        resources :work_experiences

        resources :cce_scorings, only: [:index]
        resources :career_paths
        resources :rankings
        resources :leaves
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
    resources :academic_rankings, only: [:index], path: 'academic-rankings'

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

    resource :dashboard, only: [:show]
    resource :hr_profile, only: [:show], path: 'my-hr-profile'
    resource :career_path, only: [:show], path: 'my-career-path'     
    resource :account, only: [:edit, :update], path: 'user-account', as: :user_account

    resources :leaves, only: [:index, :show]
    resources :rating_tasks, only: [:index]

    resources :qces, except: [:new, :destroy] do
      member do
        delete 'support_area' => 'qces#destroy_support_area'
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
                                  path_names: custom_path_names #do
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