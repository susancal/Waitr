Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants do
    resources :parties
    resources :prizes
  end

  # get '/restaurants/:id/prizes/new' =>'prizes#new'
  # post '/prizes' =>'prizes#create'
  # get '/restaurants/:id/prizes/edit' =>'prizes#edit'
  # put '/prizes' =>'prizes#update'

  get '/restaurants/:id/leaderboard', to: 'leaderboard#index', as: 'leaderboard'

end
