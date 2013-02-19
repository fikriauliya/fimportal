FimAlumni::Application.routes.draw do
  resources :profile_candidates, :path => 'candidates' do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      
      match 'step1' => 'profile_candidates#step1_post', :via => :post
    end
  end
  
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