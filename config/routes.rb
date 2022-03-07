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
  get 'homepage_s' => 'homepage#homepage_s', :as => 'homepage_s'
  get 'homepage_a' => 'homepage#homepage_a', :as => 'homepage_a'
  get 'flagpost' => 'reviews#flagpost', :as => 'flagpost'
  get 'unflagpost' => 'reviews#unflagpost', :as => 'unflagpost'
  get 'flagpost_c' => 'comments#flagpost_c', :as => 'flagpost_c'
  get 'unflagpost_c' => 'comments#unflagpost_c', :as => 'unflagpost_c'
  get 'pin' => 'reviews#pin', :as => 'pin'
  get 'unpin' => 'reviews#unpin', :as => 'unpin'
  post 'homepage' => 'homepage#homepage', :as => 'homepage_p'
  get 'indexlower' => 'reviews#indexlower', :as =>'indexlower'
  get 'indexupper' => 'reviews#indexupper', :as =>'indexupper'
  get 'noreview' => 'reviews#noreview', :as =>'noreview'
  root "homepage#homepage"
  get '*path', :to => 'application#routing_error'
end
