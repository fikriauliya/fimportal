class Profile < ActiveRecord::Base
  attr_accessible :batch, :dob, :fullname, :interest, :location, :motto, :place_of_birth
  validates :fullname, :batch, :presence => true
  belongs_to :user
end
