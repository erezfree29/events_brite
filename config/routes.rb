Rails.application.routes.draw do
  root  'sessions#welcome'
  resources :sessions,only: [:new, :create]
  get 'welcome', to: 'sessions#welcome'
  delete 'sign_out', to: 'sessions#destroy'
  resources :users ,only: [:new, :create, :show]
  resources :events ,only: [:new, :create, :show, :index, :destroy]
  post '/attend/:id', to: 'events#attend'
end
