Rails.application.routes.draw do

    devise_for :user, :controllers => { :registrations => 'registrations' }
    resources :cr_players, only: [:index]
    resources :clans, only: [:index]
    resources :players, only: [:index]

    resources :accounts

    devise_scope :user do
        get 'sign_in', to: 'devise/sessions#new'
    end

    root to: "home#index"
    get '*path' => redirect('/')

end
