Rails.application.routes.draw do

  root "static#home"

  resource :contact_message, only: [:create, :destroy]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:url" => "static#show"
end
