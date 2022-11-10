Rails.application.routes.draw do
  resources :genres
  resources :favorites
  resources :favourites
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root "movies#index"
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
  get "signup" => "users#new"
  get "movies/filter/:filter" => "movies#index", as: :filtered_movies
end
