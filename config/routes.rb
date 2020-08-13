Rails.application.routes.draw do
  # get 'posts', to: 'posts#index'
  devise_for :users
  root 'posts#index'
  
end
