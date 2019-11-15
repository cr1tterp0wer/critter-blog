Rails.application.routes.draw do
  resource :contact_message, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"

  get "/:url" => "static#show"
end
