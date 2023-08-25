Rails.application.routes.draw do
  root "homes#index" 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'             
      }
      devise_scope :user do  
        get '/users/employee_new', :to => 'users/registrations#employee_new'
        post '/users/employee_create',:to => 'users/registrations#employee_create'
      end
    #devise_for :users, controllers: { registrations: 'registrations' }
    # resources :companies, only: [:new, :create]
    #Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    #Defines the root path route ("/")
    # root "articles#index"

  resources :customers
  # resources :companies do 
  #   # get '/companies/:id', to: 'companies#dashboard'
  #    #get 'dashboard', to: 'companies#dashboard', on: :member
  # end

  resources :companies  do 
    collection do
      get 'dashboard'
    end
    resources :employees
    resources :products
  end
   
  # resources :companies  do 
  # end
  #resources :companies
  # resources :companies do
  # end
end
