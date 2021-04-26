Rails.application.routes.draw do
  root  'sessions#welcome'
  resources :sessions,only: [:new, :create]
  get 'welcome', to: 'sessions#welcome'
  delete 'sign_out', to: 'sessions#destroy'
  resources :users ,only: [:new, :create, :show]

end
