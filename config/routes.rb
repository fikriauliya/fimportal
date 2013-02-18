FimAlumni::Application.routes.draw do
  resource :profile_candidate
  resources :profile_candidates
  resource :profile
  resources :profiles
  
  match '/alumni' => 'home#index_alumni', :as => 'alumni_home'
  match '/candidate' => 'home#index_candidate', :as => 'candidate_home'
  
  # authenticated :user do
    # root :to => 'home#index_authenticated'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users
end