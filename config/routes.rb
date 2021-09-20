Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get 'top'=>'homes#top'
  get '/home/about' => "homes#index"

  resources:books,only:[:show,:index,:edit]

  resources :users,only:[:show,:index,:edit,:create,:new,:destroy]
end
