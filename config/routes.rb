Rails.application.routes.draw do
  root "static#home"

  resource :contact_message, only: [:create, :destroy]
  resources :users
  resources :posts

  controller :sessions do 
    get 'login' => :new
    post 'login' => :create
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:url" => "static#show"
end
