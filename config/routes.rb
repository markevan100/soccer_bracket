Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }

      resources :groups, only: [:index, :show]
      resources :teams, only: [:index, :show]
      resources :matches, only: [:index, :show]
      resources :group_picks, only: [:create, :update, :destroy]
      resources :user_picks, only: [:create, :update, :destroy]

      get 'group_standings', to: 'group_standings#index'
    end
  end
end
