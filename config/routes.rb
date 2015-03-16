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
  match "statistics/old_user_emails" => 'statistics#old_user_emails', :via => :get
  
  get "recruiter/index"
  get "recruiter/export"
  match 'recruiter/upload' => 'recruiter#new_upload', :via => :get
  match 'recruiter/upload' => 'recruiter#create_upload', :via => :post
  match 'recruiter/save_upload' => 'recruiter#save_upload', :via => :post
  match 'recruiter/index_accepted' => 'recruiter#index_accepted', :via => :get

  get 'home/faq' 

  resources :profile_candidates, :path => 'candidates', :except => [:show] do
    collection do
      # get 'step1'
      # get 'step2'
      # get 'step2_branching'

      # get 'step3'
      # get 'step3a'
      # get 'step4'
      # get 'step5'
      
      # match 'upload_photo' => 'profile_candidates#upload_photo', :via => :post
      # match 'upload_identification_card' => 'profile_candidates#upload_identification_card', :via => :post
      # match 'upload_recommendation_letter' => 'profile_candidates#upload_recommendation_letter', :via => :post
      match 'update_biodata' => 'profile_candidates#update_biodata', :via => :put
      match 'update_point' => 'profile_candidates#update_point', :via => :put
      match 'submit_confirmation' => 'profile_candidates#submit_confirmation', :via => :post
      
      match 'update_marked_by' => 'profile_candidates#update_marked_by', :via => :put
      
      match 'progress_status' => 'profile_candidates#progress_status', :via => :get

      match 'acceptance_status' => 'profile_candidates#acceptance_status', :via => :get
      match 'update_acceptance_status' => 'profile_candidates#update_acceptance_status', :via => :put
    end
  end

  resources :strategic_leader_profiles, :except => [:show, :destroy, :edit, :index]
  resources :local_leader_profiles, :except => [:show, :destroy, :edit, :index]
  resources :activist_profiles, :except => [:show, :destroy, :edit, :index]
  
  # resource :profile, :path => 'alumni'
  # resources :profiles, :path => 'alumnis', :except => [:show]
  
  # authenticated :user do
    # root :to => 'home#index_authenticated'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users
end