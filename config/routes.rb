Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :market_dishes
      resources :user_dishes
    end
    resources :ingredients, only: [:index]
    resources :tags, only: [:index]
    resources :user_dishes
    resources :market_dishes 
    resources :user_dish_ingredients 
    resources :user_dish_tags
    resources :trocs
    resources :donations
    get 'marketdishes/search', to: 'market_dishes#search'
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
