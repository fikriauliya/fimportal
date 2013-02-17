class Profile < ActiveRecord::Base
  attr_accessible :batch, :dob, :fullname, :interest, :location, :latitude, :longitude, :motto, :place_of_birth
  validates :fullname, :batch, :presence => true
  belongs_to :user
  
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
