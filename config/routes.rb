Rails.application.routes.draw do
  get 'rooms/show'
  root to:'homes#index'
  resources :events
  devise_for :studios
  devise_for :users
  resources :rooms, only: %i[show create] do
    resources :messages, only: [:create]
  end
end
