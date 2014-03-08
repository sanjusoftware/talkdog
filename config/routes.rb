Talkdog::Application.routes.draw do


  root 'events#index'
  resources :events do
    resources :talks
  end

end
