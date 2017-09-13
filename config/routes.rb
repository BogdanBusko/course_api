Rails.application.routes.draw do  
  scope module: 'api/v1' do
    resources :main, only: [:index]
    resources :categories, only: [:show, :create]
    resources :courses, only: [:show, :create, :update, :destroy]
  end
end
