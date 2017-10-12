Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope module: 'api/v1' do
    resources :main, only: :index
    resources :categories, only: %i[show create]
    resources :courses, only: %i[show create update]
    scope module: 'users' do
      post 'sign_in', to: 'sessions#create'
      post 'sign_up', to: 'registration#create'
      get 'profile', to: 'profile#show'
    end
  end
end
