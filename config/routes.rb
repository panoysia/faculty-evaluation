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

    resources :employees
    resources :leaves
    resources :rating_periods
    resources :academic_rankings, only: [:index]
    resources :students
  end


  scope module: :user do
    root 'sessions#new'

    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
    post 'login' => 'sessions#create', as: :authenticate_user

    resource :dashboard, only: [:show]
  end

  #scope ':username' do
    # resources :ratings
    # => /panoy/leaves/3
    # => params[:username] in controller, helper, views
  #end
end