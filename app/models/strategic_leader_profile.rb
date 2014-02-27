class StrategicLeaderProfile < ActiveRecord::Base
  attr_accessible :activity1_information, :activity1_reason, :activity2_information, :activity2_reason, :activity3_information, :activity3_reason, :activity4_information, :activity4_reason, :activity5_information, :activity5_reason, :organization_information, :essay_about_indonesia
  

  belongs_to :user

  validates :activity1_information, :activity1_reason, 
  	:activity2_information, :activity2_reason, :activity3_information, 
  	:activity3_reason, :activity4_information, :activity4_reason, :activity5_information, 
  	:activity5_reason, :organization_information, :essay_about_indonesia, :presence => true

  validates_length_of :activity1_reason, :activity2_reason, :activity3_reason, :activity4_reason, 
  	:activity5_reason, :too_long => 'Terlalu panjang, melebihi 350 karakter', :maximum => 350
end
