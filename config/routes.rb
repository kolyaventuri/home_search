Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/search', to: 'search#index'

  get '/favorites', to: 'favorites#index'

  namespace :api do
    namespace :v1 do
      namespace :homes do
        get '/featured', to: 'featured#index'
        get '/search', to: 'search#index'
        put '/favorite/:id', to: 'favorites#update'
      end
    end
  end
end
