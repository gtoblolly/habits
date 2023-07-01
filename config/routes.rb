Rails.application.routes.draw do
  devise_for :users
  root to: "habits#index"
  resources :habits do
    resources :records, only: [:new, :create, :show, :destroy, :edit, :update] do
      resource :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: :show
  get '/records/date', to: 'records#date'
end