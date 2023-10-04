Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
  resources :users, only: %i[show]

  namespace :mypage do
    resources :posts, only: %i[index show destroy]
    resources :posts, only: :show
    resources :bookmarks
  end
end
