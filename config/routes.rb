Rails.application.routes.draw do
  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  root to: 'parks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
