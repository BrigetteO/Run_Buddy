# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'

  resources :runs do
    resources :comments, except: :index
    resources :kudos, only: :create
  end

  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users, only: [:new, :create]

  resources :conversations do
    resources :messages
  end

  root to: "runs#index"
end


