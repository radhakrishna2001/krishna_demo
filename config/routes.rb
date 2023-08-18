Rails.application.routes.draw do
  root "companies#index" 
  
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
    #devise_for :users, controllers: { registrations: 'registrations' }
   resources :companies, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :customers

  resources :companies  do 
    resources :employees
    resources :products
  end
   
  # resources :companies  do 
  # end
  #resources :companies
  resources :companies do
  member do
    get 'dashboard'
  end
  end
end
