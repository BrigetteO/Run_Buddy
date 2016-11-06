# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  
  resources :events, only: :index do 
    resources :users_events, only: :create
  end 

  resources :runs, except: :show do
    resources :comments
    resources :kudos, only: :create 
  end

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :users, only: [:new, :create] do
    resources :messages, only: [:new, :create, :show]
  end 

  root to: "welcome#index"
end


