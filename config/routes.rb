Rails.application.routes.draw do
  root "user#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
  
  get "conversations", to: "conversations#index" 

  resources :conversations, only:[:create,:new,:destroy,:show] do
  	resources :messages, only:[:create]
  end
end
