Rails.application.routes.draw do
  resources :addresses
  resources :orders
  devise_for :users
  resources :cart_line_items
  resources :reviews	
  resources :categories 
  resources :products #routes for index, new
  get 'say/hello'
  get 'test/index'
  root 'say#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
