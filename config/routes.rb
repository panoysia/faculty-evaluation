Rails.application.routes.draw do

=begin  
  Samples:
  
  * get '/clients/:status' => 'clients#index', foo: 'bar'

=end

  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }

  # devise_for :admin_users

  namespace :admin do
    get 'dashboard' => 'admin/dashboard#show'
    resource :employees
    resource :leaves
  end

  root 'dashboard#show'
  
  get 'dashboard' => 'dashboard#show'
  get 'test' => 'dashboard#test'
  # Customize devise logins
    # change /users/sign_in to /users/login

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