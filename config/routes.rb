# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  get 'messages', to: 'messages#new', as: 'new_message'
  post 'messages', to: 'messages#create', as: 'message'

  resources :runs do
    resources :comments, except: :index
    resources :kudos, only: :create
  end
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: "runs#index"
end


