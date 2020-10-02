Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  root to: "top_pages#home"
  get  "top_pages/help"
  get  "top_pages/message"

  resources :users
  resources :trainings
  resources :events, only: [:new, :create, :destroy]
end