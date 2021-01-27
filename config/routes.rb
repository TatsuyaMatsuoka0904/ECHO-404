Rails.application.routes.draw do
  root to:'homes#index'
  get '/rooms' => 'rooms#index'
  get 'rooms/show'
  get 'contacts/new'
  get 'contacts/create'
  resources :events

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :users, :only => [:index, :show]

  devise_for :studios, controllers: {
    sessions: "studios/sessions",
    registrations: "studios/registrations",
    passwords: "studios/passwords",
  }
  resources :studios, only: %i[index show]

  resources :rooms, only: %i[show create] do
    resources :messages, only: [:create]
  end
end
