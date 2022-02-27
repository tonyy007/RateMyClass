Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end
  resources :users
  #devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  get 'login' => 'login#login', :as => 'login'
  get 'logout' => 'logout#logout', :as => 'logout'
  get 'signup' => 'signup#signup', :as => 'signup'
  get 'homepage' => 'homepage#homepage', :as => 'homepage'
  get 'indexlower' => 'reviews#indexlower', :as =>'indexlower'
  get 'indexupper' => 'reviews#indexupper', :as =>'indexupper'
  #root "login#login"
  #root "users#index"
  root "homepage#homepage"
end
