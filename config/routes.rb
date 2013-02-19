FimAlumni::Application.routes.draw do
  resources :profile_candidates, :path => 'candidates'
  resource :profile
  resources :profiles
  
  match '/alumni' => 'home#index_alumni', :as => 'alumni_home'
  
  # authenticated :user do
    # root :to => 'home#index_authenticated'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users
end