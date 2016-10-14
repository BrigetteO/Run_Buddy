# Syntax: verb 'path', to: 'controller#action'

Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: 'profile'

  resources :runs do
    resources :comments, except: :index
    resources :kudos, only: :create
  end

  devise_for :users, controllers: { registrations: 'users/registrations'}

  resources :users, only: [:new, :create]

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  root to: "runs#index"
end


