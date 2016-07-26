Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'


  resources :restaurants, only: [:show] do
    get '/waitingroom' => 'restaurants#waitingroom'
    resources :parties
    resources :prizes
  end

  resources :quizzes do
    resources :rounds do
      # resources :questions
    end
  end

  resources :guesses, only: [:create]
  root 'restaurants#index'

  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/restaurants/:id', to: 'restaurants#show', as: 'r_show'
  get '/check' => 'waitingroom#check'
  get '/match' => 'waitingroom#match'
  get '/coms' => 'waitingroom#sendstatus'
  get '/rounds/key/:key' => 'rounds#show'
  get '/rounds/key/:key/summary' => 'rounds#summary'

  # mount ActionCable.server => "/cable"
end
