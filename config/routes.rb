Rails.application.routes.draw do

  post 'admin/login' => 'admin/sessions#create', as: :authenticate_admin

  namespace :admin do    
    # root to: redirect('admin/dashboard')
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'

    resource :dashboard, only: [:show]
    resources :admins
    resources :users

    # resources :forum_threads do
    #   resources :forum_posts, module: :forum_threads
    # end

    resources :employees do
      scope module: :employees do
        resources :educations, only: [:index]
        resources :trainings, only: [:index]
        resources :civil_service_eligibilities, only: [:index]
        resources :other_infos, only: [:index]
        resources :voluntary_works, only: [:index]
        resources :work_experiences, only: [:index]
      end
    end

    scope path: 'ratings' do
      resources :instructions, only: [:new, :create, :show]
      resources :researches, only: [:new, :create, :show]
      resources :extensions, only: [:new, :create, :show]
      resources :productions, only: [:new, :create, :show]
    end

    resources :leaves
    resources :career_paths
    resources :rating_periods, path: 'rating-periods'
    resources :academic_rankings, only: [:index], path: 'academic-rankings'
    resources :students

    resource :account, only: [:edit, :update]
  end


  scope module: :user do
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'login' => 'sessions#create', as: :authenticate_user

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


class ForumThreads::ForumPostsController < ApplicationController

class ForumThreadsController < ApplicationController

# /forum_threads
    forum_posts_controller.rb

  forum_threads_controller.rb 
=end