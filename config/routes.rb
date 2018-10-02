Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'rails_admin'
  resources :storage_units do
    resources :units do
      get 'filter', on: :collection
    end
    get 'filter', on: :collection
  end

  resource :search, controller: :search do
    get 'retrieve_cities_zip', on: :collection
  end

  root 'search#index'

end
