Rails.application.routes.draw do

  namespace :admin do    
    # root to: redirect('admin/dashboard')
    resource :dashboard, only: [:show]
    resources :admin_users

    resources :employees
    resources :leaves
    resources :rating_periods
    resources :academic_rankings, only: [:index]
    resources :students
  end

  root 'dashboard#show'
  resource :dashboard, only: [:show]

  #scope ':username' do
    # root to: redirect('dashboard')
    # root 'dashboard#show'
    #resource :dashboard, only: [:show]
    # resources :ratings
    # => /panoy/leaves/3
    # => params[:username] in controller, helper, views
  #end
end