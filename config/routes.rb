Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  post 'login' => 'login#login', :as => 'login'
  #root "login#login"
  root "users#index"
end
