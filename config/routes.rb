Rails.application.routes.draw do
  root to: "habits#index"
  resources :habits do
  resources :records, only: [:new, :create, :show]
  end
end