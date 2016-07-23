Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :party


  resources :quizzes do
    resources :rounds do
      resources :questions
      resources :guesses
    end
  end

  resources :guesses
end
