Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  namespace :instructor do
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
  resources :courses, only: [:index, :show]
end
