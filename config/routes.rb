Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }do 
    namespace :v1 do 
      resources :users, only: [:show, :update]
      resource  :registration, only: [:create]
      resources :sessions, only: [:create, :destroy]
      resources :main, only: [:index]
      resources :categories, only: [:show, :create]
      resources :courses, only: [:show, :create, :update, :destroy]
    end
  end
end
