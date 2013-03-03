class Profile < ActiveRecord::Base
  attr_accessible :batch, :dob, :fullname, :interest, :location, :latitude, :longitude, 
    :motto, :place_of_birth, :program, :facebook, :twitter, :is_email_displayed
    
  validates :fullname, :batch, :presence => true
  belongs_to :user
end
