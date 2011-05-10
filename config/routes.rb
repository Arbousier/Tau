Coworking::Application.routes.draw do
  devise_for :users

  resources :subscribers, :posts

  root :to => "application#index"

end
