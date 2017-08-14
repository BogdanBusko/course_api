Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resource :session, only: [:create, :destroy]
      resources :main, only: [:index]
      resources :categories, only: [:show, :create]
      resources :courses, only: [:show, :create, :update, :destroy]
      resources :subscribers, only: [:create]
    end
  end
end
