FimAlumni::Application.routes.draw do
  resource :profile
  resources :profiles
  
  authenticated :user do
    root :to => 'home#index_authenticated'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end