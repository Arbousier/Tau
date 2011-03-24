Coworking::Application.routes.draw do
  devise_for :users

  resources :subscribers

  root :to => "application#index"

end
