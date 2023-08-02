Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "companies#index"

  resources :companies  do 
    resources :employees
  end
   
   resources :companies  do 
    resources :products
  end


end
