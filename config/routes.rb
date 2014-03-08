Talkdog::Application.routes.draw do
  devise_for :users
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'

  resources :events do
    resources :talks do
      member do
        get :capture_rating
      end
      resources :presenters
    end
  end
end
