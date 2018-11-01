Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin/', as: 'rails_admin'
  scope "/:locale" do
    scope :self_storage do
      controller :storage_units do
          get '/:city', action: :index, as: 'self_storages'
      end
    end
    resources :storage_units do
      resources :units do
        get 'filter', on: :collection
      end
      get 'filter', on: :collection
    end

    resource :search, controller: :search do
      get 'retrieve_cities_zip', on: :collection
    end
  end
  root 'search#index'
  get '/:locale' => 'search#index', as: 'root_locale'

  get '/:locale/self_storage/:city/:id', to: 'storage_units#show', as: 'self_storage'
end
