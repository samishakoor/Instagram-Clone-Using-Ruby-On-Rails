Rails.application.routes.draw do


  get 'stories/destroy'
  get 'stories/new'
  get 'stories/create'
  root to: "posts#index"


  get 'search', to: "users#search"


  get 'posts/myposts'
  get 'users/notifications'


  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  resources :stories
  resources :likes, only: [:create, :destroy]
  resources :users

  resources :posts do
    resources :comments
  end

  post 'users/:id/follow', to: "users#follow", as: "follow"
  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  post 'users/:id/accept', to: "users#accept", as: "accept"
  post 'users/:id/decline', to: "users#decline", as: "decline"
  post 'users/:id/cancel', to: "users#cancel", as: "cancel"

end
