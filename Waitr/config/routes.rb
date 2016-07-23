Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :party
  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'

end
