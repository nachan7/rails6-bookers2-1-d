Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  devise_for :users
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  get "tag_search" => "tag_searches#tag_search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
   get 'relationships/followers' => 'relationships#followers', as: 'followers'
   get 'relationships/followings' => 'relationships#followings', as: 'followings'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
