Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :dishes
      resources :trocs, only: [:index]
      resources :donations, only: [:index]
    end
    resources :ingredients, only: [:index]
    resources :tags, only: [:index]
    resources :dishes
    resources :dish_ingredients 
    resources :dish_tags
    resources :trocs
    resources :donations
    get 'search', to: 'dishes#search'
  end

  devise_for :users,
  defaults: { format: :json },
  path: '',
  path_names: {
    sign_in: 'api/login',
    sign_out: 'api/logout',
    registration: 'api/signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

end
