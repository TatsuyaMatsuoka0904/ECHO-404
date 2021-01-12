Rails.application.routes.draw do
  get 'studios/show'
  root to:'homes#index'
  get 'rooms/show'
  resources :events
  devise_for :studios
  devise_for :users 
  get 'users/show' => 'users#show'
  resources :rooms, only: %i[show create] do
    resources :messages, only: [:create]
  end
end
