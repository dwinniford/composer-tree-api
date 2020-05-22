Rails.application.routes.draw do
  
  root to: "application#cookie"
  post '/login', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  resources :users
  resources :trees do 
    resources :notes 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
