Rails.application.routes.draw do

  resources :restaurants do
    resources :parties
    resources :prizes
  end

  resources :quizzes do
    resources :rounds do
      get '/summary' => 'rounds#summary'
      resources :questions #can get rid of a lot of these routes
      resources :guesses #can get rid of a lot of these routes
    end
  end

  root 'restaurants#show'

  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/restaurants/:id', to: 'restaurants#show', as: 'r_show'

  resources :rounds
  post '/rounds/new' => 'rounds#create'
  mount ActionCable.server => "/cable"
end
