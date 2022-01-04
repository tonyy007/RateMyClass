Rails.application.routes.draw do
#   get  'new'    => 'word_guesser_games#new',   :as => 'new_game'
#   post 'create' => 'word_guesser_games#create',:as => 'create_game'
#   get  'show'   => 'word_guesser_games#show',  :as => 'game'
#   post 'guess'  => 'word_guesser_games#guess', :as => 'guess'
#   get  'win'    => 'word_guesser_games#win',   :as => 'win_game'
#   get  'lose'   => 'word_guesser_games#lose',  :as => 'lose_game'

#   root 'word_guesser_games#new'

    #get '_static127.0.0.1:8080' => 'ratemyclass#login'
    post 'login'   => 'ratemyclass#login',       :as => 'login'
    
    root 'ratemyclass#login'
end