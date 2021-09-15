Rails.application.routes.draw do
  root to: "habits#index"
  resources :habits, only: [:index, :new, :create, :destroy]
end
