Rails.application.routes.draw do

  resources :storage_units do
    resources :units
    get 'filter', on: :collection
  end

  resource :search, controller: :search do
    get 'retrieve_cities_zip', on: :collection
  end

  root 'search#index'

end
