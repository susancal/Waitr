Rails.application.routes.draw do
  get '/restaurants/login' => 'sessions#new'



  resources :restaurants, only: [:show] do
    get '/waitingroom' => 'rounds#waitingroom'
    resources :parties
    resources :prizes
  end

  resources :quizzes do
    resources :rounds do
      get '/summary' => 'rounds#summary'
      # resources :questions
    end
  end

  resources :guesses, only: [:create]
  root 'restaurants#show'

  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/restaurants/:id', to: 'restaurants#show', as: 'r_show'

  # mount ActionCable.server => "/cable"
end
