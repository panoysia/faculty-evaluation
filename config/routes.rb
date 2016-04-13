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
    resources :qces, :cces
  
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

    scope path: 'ratings' do
      resources :instructions, only: [:new, :create, :show]
      resources :researches, only: [:new, :create, :show]
      resources :extensions, only: [:new, :create, :show]
      resources :productions, only: [:new, :create, :show]
    end

    resources :leaves
    resources :leave_service_credits
    
    resources :specializations
    resources :career_paths
    resources :career_path_actions
    
    resources :academic_years, path: 'academic-years'
    # resources :rating_periods, path: 'rating-periods'
    resources :academic_rankings, only: [:index], path: 'academic-rankings'
    resources :students
    resource :account, only: [:edit, :update]
  end


  scope module: :user do
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'login' => 'sessions#create', as: :authenticate_user

    resources :leaves, only: [:index, :show]
    resources :qce_ratings
    
    resource :dashboard, only: [:show]
    resource :hr_profile, only: [:show], path: 'my-hr-profile'
    resource :career_path, only: [:show], path: 'my-career-path'     
    resource :account, only: [:edit, :update], path: 'user-account', as: :user_account    
  end


=begin
  Translated paths:
    * 
=end

  #scope ':username' do
    # resources :ratings
    # => /panoy/leaves/3
    # => params[:username] in controller, helper, views
  #end
end

=begin

resources :forum_threads do
  resources :forum_posts, module: :forum_threads
end

class ForumThreads::ForumPostsController < ApplicationController

class ForumThreadsController < ApplicationController

# /forum_threads
    forum_posts_controller.rb

  forum_threads_controller.rb 
=end