Rails.application.routes.draw do

  root 'parties#index'
  
  resources :parties

end
