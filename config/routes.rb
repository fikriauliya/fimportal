FimAlumni::Application.routes.draw do
  get "recruiter/index"

  resources :profile_candidates, :path => 'candidates', :except => [:show] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      
      match 'upload_photo' => 'profile_candidates#upload_photo', :via => :post
      match 'upload_recommendation_letter' => 'profile_candidates#upload_recommendation_letter', :via => :post
      match 'update_biodata' => 'profile_candidates#update_biodata', :via => :put
      match 'submit_confirmation' => 'profile_candidates#submit_confirmation', :via => :post
    end
  end
  
  resource :profile, :path => 'alumni'
  resources :profiles, :path => 'alumnis', :except => [:show]
  
  # authenticated :user do
    # root :to => 'home#index_authenticated'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users
end