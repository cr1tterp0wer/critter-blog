Rails.application.routes.draw do
  root "static#home"

  resources :contact_messages, only: [:index, :create, :destroy]
  resources :users
  resources :posts

  controller :sessions do 
    get 'login' => :new
    post 'login' => :create
    get  'logout' => :logout
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:url" => "static#show"
end
