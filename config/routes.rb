Rails.application.routes.draw do
  devise_for :users
  root to: "habits#index"
  resources :habits do
    resources :records, only: [:new, :create, :show, :destroy, :edit, :update]
  end
end