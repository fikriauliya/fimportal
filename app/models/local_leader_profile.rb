class LocalLeaderProfile < ActiveRecord::Base
  attr_accessible :essay_about_organization, :organization_information, :organization_name,
   :organization_year, :organization_category, :organization_activity, 
   :organization_count_member, :organization_goal, :organization_achievement,
   :organization_contact, :organization_network

  belongs_to :user

  #not check validates :organization_information
  
  validates :essay_about_organization, :organization_name,
   :organization_year, :organization_category, :organization_activity, 
   :organization_count_member, :organization_goal, 
   :organization_contact, :organization_network, :presence => true

  validates_length_of :essay_about_organization, :too_long => 'Terlalu panjang, melebihi 1000 karakter', :maximum => 1000, :tokenizer => lambda {|str| str.scan(/\S+/) }
end
