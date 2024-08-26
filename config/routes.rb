Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :posts
  devise_for :users, controllers: { registrations: 'users/registrations',sessions:'users/sessions' }

  get "home/index"
  get 'dashboard', to: 'home#dashboard', as: :dashboard

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#index"
  get 'home/contact'
end
