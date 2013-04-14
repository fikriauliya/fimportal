FimAlumni::Application.routes.draw do
  # get "statistics/complete"
  match 'uploader/edit_profile_candidate' => 'uploader#edit_profile_candidate', :via => :get
  match 'uploader/upload_profile_candidate' => 'uploader#upload_profile_candidate', :via => :post
  
  match "statistics/" => 'statistics#public', :via => :get, :as => 'statistics_public'
  match "statistics/lengkapkapkap" => 'statistics#complete', :via => :get, :as => 'statistics_complete'
  match "statistics/not_submitted_emails" =>  'statistics#not_submitted_emails', :via => :get
  match "statistics/submitted_emails" =>  'statistics#submitted_emails', :via => :get
  match "statistics/not_submitted_phones" =>  'statistics#not_submitted_phones', :via => :get
  match "statistics/is_update_allowed_emails" => 'statistics#is_update_allowed_emails', :via => :get
  
  get "recruiter/index"
  match 'recruiter/upload' => 'recruiter#new_upload', :via => :get
  match 'recruiter/upload' => 'recruiter#create_upload', :via => :post
  match 'recruiter/save_upload' => 'recruiter#save_upload', :via => :post

  resources :profile_candidates, :path => 'candidates', :except => [:show] do
    collection do
      match 'step1' => 'home#closed', :via => :get
      match 'step2' => 'home#closed', :via => :get
      match 'step3' => 'home#closed', :via => :get
      match 'step4' => 'home#closed', :via => :get
      match 'step5' => 'home#closed', :via => :get
      
      match 'upload_photo' => 'home#closed', :via => :post
      match 'upload_recommendation_letter' => 'home#closed', :via => :post
      match 'edit_workshop' => 'home#closed', :via => :get
      match 'update_workshop/:changed' => 'home#closed', :via => :put, :as => 'update_workshop'
      match 'submit_confirmation' => 'home#closed', :via => :post
      
      match 'update_biodata' => 'profile_candidates#update_biodata', :via => :put
      match 'update_point' => 'profile_candidates#update_point', :via => :put
      
      match 'update_marked_by' => 'profile_candidates#update_marked_by', :via => :put
      
      match 'progress_status' => 'profile_candidates#progress_status', :via => :get
      match 'acceptance_status' => 'profile_candidates#acceptance_status', :via => :get
      match 'update_accepted_location' => 'profile_candidates#update_accepted_location', :via => :put, :as => 'update_accepted_location'
    end
  end
  
  # resource :profile, :path => 'alumni'
  # resources :profiles, :path => 'alumnis', :except => [:show]
  
  # authenticated :user do
    # root :to => 'home#index_authenticated'
  # end
  match "home/faq" => 'home#faq', :via => :get
  match "home/agenda" => 'home#agenda', :via => :get
  root :to => "home#index"
  devise_for :users
  resources :users
end