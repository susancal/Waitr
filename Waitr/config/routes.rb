Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :restaurants do 
    resources :parties 

  end

  # put '/restaurants/:restaurant_id/parties/:id', to: 'parties#rex', as: 'party_update'
  
  resources  :prizes


  root 'restaurants#show'
  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/restaurants/:id', to: 'restaurants#show', as: 'r_show'

end