Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'

  get "home/about" ,to: 'homes#new',as: 'home_about'
  post '/users/:id/edit' => 'users#create'
  patch 'users/:id/edit' => 'users#create', as:'update_user'
  post 'users/:id' => 'users#create'
  post 'books/:id' => 'books#create'
  post 'users/:id' => 'users#index'






  resources:books,only:[:index,:show,:edit,:create,:update,:destroy]

  resources :users,only:[:create,:index,:show,:edit,:update]
end
