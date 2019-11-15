Rails.application.routes.draw do
  resources :sessions
  root "static#home"

  resource :contact_message, only: [:create, :destroy]
  resources :users
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:url" => "static#show"
end
