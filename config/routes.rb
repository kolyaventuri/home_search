Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      namespace :homes do
        get '/featured', to: 'featured#index'
        get '/search', to: 'search#index'
      end
    end
  end
end
