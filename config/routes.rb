Rails.application.routes.draw do
  resources :clans, only: [:index]
  resources :players, only: [:index]
  root to: "home#index"
  get '*path' => redirect('/')

end
