Rails.application.routes.draw do
 
  devise_for :users
  root to: 'items#index'
  get 'items/id', to: 'items#checked'
  resources :items, only: [:index, :new, :create, :show]
  

  
end
