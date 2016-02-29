Rails.application.routes.draw do

  namespace :admin do    
    root to: redirect('admin/dashboard')
    resource :dashboard, only: [:show]
    resources :admins
    resources :users

    resources :employees
    resources :leaves
    resources :rating_periods
    resources :academic_rankings, only: [:index]
    resources :students
  end

  

  scope module: :user do
    root 'dashboard#show'
    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'authenticate_user' => 'sessions#create', as: :authenticate_user

    resource :dashboard, only: [:show]
  end


  # resources :sessions, only: [:create]

  #scope ':username' do
    # root to: redirect('dashboard')
    # root 'dashboard#show'
    #resource :dashboard, only: [:show]
    # resources :ratings
    # => /panoy/leaves/3
    # => params[:username] in controller, helper, views
  #end
end