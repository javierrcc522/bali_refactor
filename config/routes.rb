Rails.application.routes.draw do

  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'

  get '/sign_in' => 'sessions#new'
  post '/sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#destroy'

  root to: "products#index"

  resources :products, only: [:index]
  resources :order_items
  resource :cart, only: [:show]


  get 'finalize' => 'carts#finalize'

end
