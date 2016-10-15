# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'

  resources :runs do
    resources :comments, except: :index
    resources :kudos, only: :create
  end

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :conversations, only: [:index, :show, :destroy]

  resources :users, only: [:new, :create] do
    resources :messages, only: [:new, :create]
  end 

  root to: "welcome#index"
end


