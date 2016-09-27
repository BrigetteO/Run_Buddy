# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'

  resources :runs do
    resources :comments, except: :index
    resources :kudos, only: :create
  end

  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users, only: [:new, :create] do
    get 'messages/new', to: 'messages#new', as: 'new_message'
    post 'messages', to: 'messages#create', as: 'messages'
  end

  root to: "runs#index"
end


