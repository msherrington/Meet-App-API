Rails.application.routes.draw do


  scope :api do
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
    post 'auth/facebook', to: 'oauth#facebook'
    post 'tickets', to: 'tickets#create'
    resources :users
    resources :events
    resources :tickets
    resources :categories
    resources :comments
    resources :conversations, only: [:index, :create] do
      resources :messages, only: [:index, :create]
    end
  end
end
