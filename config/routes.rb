Rails.application.routes.draw do
  root to: "runs#index"
  resources :users
  devise_for :users
  devise_scope :user do
    get 'register', to: "devise/registrations#new", as: :register
    get 'login', to: 'devise/sessions#new', as: :login
  end
  resources :messages, :except => [:index]
  resources :runs do
    resources :comments, :except => [:index]
    resources :kudos, :except => [:index]
  end
end
