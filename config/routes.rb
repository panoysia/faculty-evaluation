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
    resources :admins
    resources :users
    resources :nbcs
    resources :holidays
    resources :qces
    resources :cces
    
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

        resources :career_paths
        resources :rankings
        resources :leaves
      end

      # member do
        # perform_ranking_admin_employee_path
        # admin/perform_rankings#index
        # /admin/employees/:id/perform-ranking(.:format) 

        # get 'perform-ranking'
      # end

      # collection do
      # end
    end

    resources :leaves
    resources :leave_service_credits
    
    resources :career_paths
    resources :career_path_actions
    resources :specializations
    
    resources :academic_years, path: 'academic-years'
    # resources :rating_periods, path: 'rating-periods'
    resources :academic_rankings, only: [:index], path: 'academic-rankings'
    resources :students
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
        resource :supervisor_instruction_rating, only: [:create, :destroy]
        resource :peer_instruction_rating, only: [:create, :destroy]
        resource :student_instruction_rating, only: [:create, :destroy]

        resource :clientele_instrument, only: [:create, :destroy]
        resource :leadership_instrument, only: [:create, :destroy]
        resource :partnership_instrument, only: [:create, :destroy]
        resource :community_instrument, only: [:create, :destroy]
      end 
    end

    namespace :qce do
      resources :ratings, only: [:edit, :update],
                          path_names: { edit: :evaluate }
      resources :instructions
    end
    # User::QCE::RatingsController
    # user/qce/ratings/:id/
    # user/qce/ratings/:id/evaluate
=begin

    user/qces/:id
    user/qces/:id/instruction_ratings/:rating_id
    user/qces/:id/research_ratings/:rating_id

    User::EvaluationsController
    User::RatingEvaluationsController

    user/evaluations/:id/evaluate
    user/rating_evaluations/1/evaluate
    user/rating_tasks

    /rating_tasks
    /rating_tasks/55/evaluate

    /instruction_ratings/3/evaluate
    /research_ratings/88/evaluate
    
    edit: evaluate
    patch: 

    current_user.account.instruction_ratings
=end    

  end   # scope module: :user


  #scope ':username' do
    # resources :ratings
    # => /panoy/leaves/3
    # => params[:username] in controller, helper, views
  #end
end

# namespace :ratings do
#   resources :instructions, only: [:new, :create, :show]
#   resources :researches, only: [:new, :create, :show]
#   resources :extensions, only: [:new, :create, :show]
#   resources :productions, only: [:new, :create, :show]

#   resources :questions
# end

# scope module: :evaluations do      
#     resources :instruction_ratings,
#       module: :qce,
#       only: [:edit, :update],
#       path: 'evaluate/instruction_ratings',
#       path_names: { edit:  'evaluate' },
#       as: 'evaluate_qce_instruction_rating'
# end
