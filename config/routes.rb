Rails.application.routes.draw do
  resources :categories 
  resources :products #routes for index, new
  get 'say/hello'
  get 'test/index'
  root 'say#hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
