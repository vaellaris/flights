Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end
  # to route requests that arent for existing paths predefined in our api back to our index path
  # this will allow us routing to our react compenents without interfering with out actual Rails Routes.
  get '*path', to: 'pages#index', via: :all
end
