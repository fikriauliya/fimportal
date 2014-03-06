class StrategicLeaderProfile < ActiveRecord::Base
  attr_accessible :activity1_information, :activity1_reason, 
  	:activity2_information, :activity2_reason, :activity3_information, 
  	:activity3_reason, :activity4_information, :activity4_reason, 
  	:activity5_information, :activity5_reason, 
  	:organization_information, :essay_about_indonesia, :organization_name,
   	:organization_year, :organization_category, :organization_activity, 
   	:organization_count_member, :organization_goal, :organization_achievement,
   	:organization_contact, :organization_network
  

  belongs_to :user

  # not check :organization_information

  validates :activity1_information, :activity1_reason, 
  	:activity2_information, :activity2_reason, :activity3_information, 
  	:activity3_reason, :activity4_information, :activity4_reason, :activity5_information, 
  	:activity5_reason, :essay_about_indonesia, 
  	:organization_name, :organization_year, :organization_category, :organization_activity, 
    :organization_count_member, :organization_goal,
    :organization_contact, :organization_network, :presence => true

  validates_length_of :activity1_reason, :activity2_reason, :activity3_reason, :activity4_reason, 
  	:activity5_reason, :too_long => 'Terlalu panjang, melebihi 350 karakter', :maximum => 350

  validates_length_of :essay_about_indonesia, :too_long => 'Terlalu panjang, melebihi 1000 karakter', :maximum => 10000
end
