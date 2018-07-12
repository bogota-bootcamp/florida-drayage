Rails.application.routes.draw do
  root "user#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
  resources :messages, only:[:create]
  resources :conversations, only:[:create,:new,:destroy,:show]
end
