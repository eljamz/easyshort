Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  resources :users
  resources :links

  get '/all' => 'home#all'
  get '/mylinks' => 'users#mylinks'
  get ':slug' => 'links#show'
  

end
