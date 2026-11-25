Rails.application.routes.draw do
  resources :posts, only: [ :index, :create, :show ]
  get "up" => "rails/health#show", as: :rails_health_check
end
