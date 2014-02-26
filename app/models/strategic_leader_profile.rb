class StrategicLeaderProfile < ActiveRecord::Base
  attr_accessible :activity1_information, :activity1_reason, :activity2_information, :activity2_reason, :activity3_information, :activity3_reason, :activity4_information, :activity4_reason, :activity5_information, :activity5_reason, :organization_information, :essay_about_indonesia
  

  belongs_to :user

  #validates :activity1_information, :activity1_reason, :activity2_information, :activity2_reason, :activity3_information, :activity3_reason, :activity4_information, :activity4_reason, :activity5_information, :activity5_reason, :organization_information, :essay_about_indonesia => true
end
