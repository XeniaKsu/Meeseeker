Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :meeseeks do

    collection do
      get :my_bookings
    end


    resources :bookings, only: [:index, :show, :update, :destroy, :create]
  end





  #   resources :bookings, only: [:new, :create, :show, :index]
  # end
  # resources :users
end
