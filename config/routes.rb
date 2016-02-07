Rails.application.routes.draw do
  
  # route admin_user login to admin_user dashboard
  # route user login to user dashboard

  devise_for :admin_users
  devise_for :users

  namespace :admin do
    root to: redirect('admin/dashboard')
    resource :dashboard, only: [:show]
    resources :admin_users
    resources :employees
    resources :rating_periods
    # resources :academic_rankings
  end

  root to: redirect('dashboard')
  resource :dashboard, only: [:show]
  # get 'test' => 'dashboard#test'


  # Customize devise logins
    # change /users/sign_in to /users/login

    # devise_for :users, path_names: {
    #   sign_in: 'login',
    #   sign_out: 'logout'
    # }

=begin  
  Samples:
  
  * get '/clients/:status' => 'clients#index', foo: 'bar'

=end

=begin
  /elmersia/dashboard
  /elmersia/leaves
  /elmersia/evaluations
    /elmersia/evaluations/qce/new
    /elmersia/evaluations/cce/new

  /elmersia/dashboard
  /elmersia/leaves
  /elmersia/evaluations
    /elmersia/evaluations/qce/new
    /elmersia/evaluations/cce/new

  scope '/:username' do
    resource :dashboard, only: [:show]
    resources :leaves

    resources :qces do #, as: 'qce_evaluations'
    end 
    
    resources :cces #, as: 'cce_evaluations'

    # get '/evaluations' => 'evaluations#index'
    # scope '/evaluations' do
    # end
  end

  # /elmersia/rate/michelle/qce/1/
  # /elmersia/ratings/perform_QCE
  # /elmersia/ratings/perform_CCE
  # /elmersia/ratings/QCE/new
  # /elmersia/ratings/CCE/new
  # /elmersia/ratings/new


  # resources :ratings, only: :index do
  #   get 'qce' => 'qce#index'
  #   get 'cce' => 'cce#index'
  #   # resources :qce_ratings
  #   # resources :cce_ratings
  # end

  /admin/dashboard
  /admin/employees
  /admin/leaves
  /admin/career-pathing

  /elmersia/dashboard
  /elmersia/ratings
    * show both QCE & CCE ratings

  resource :ratings do
    resource :qce, :cce
  end

  /elmersia/ratings/perform_QCE
  /elmersia/ratings/perform_CCE
  /elmersia/ratings/QCE/new
  /elmersia/ratings/CCE/new
  /elmersia/ratings/new

  /elmerisa/ratings/evaluate

  /elmersia/leaves
    * show my latest leaves
  
  /elmersia/my-ranking-guide
  /elmersia/my-career-path
  /elmersia

  /ratings/qce
  /ratings/cce

=end

end