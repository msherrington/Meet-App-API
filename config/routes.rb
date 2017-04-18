Rails.application.routes.draw do
  scope :api do
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    resources :users
    resources :events
    resources :tickets
    resources :categories
    resources :comments
    resources :conversations
    resources :messages
  end
end
