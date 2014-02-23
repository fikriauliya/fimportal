class StrategicLeaderProfile < ActiveRecord::Base
  attr_accessible :activity_duration, :activity_leader_phone, :activity_name, :activity_reason, :activity_role, :activity_scope
  
  belongs_to :user
end
