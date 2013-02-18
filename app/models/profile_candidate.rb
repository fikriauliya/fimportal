class ProfileCandidate < ActiveRecord::Base
  attr_accessible :application_count, :batch, :blood_type, :committee, :dob, :email, :fullname, :gender, :hobby, :information_from, :location, :motivation, :non_formal_education, :organization, :performance_type, :phone, :place_of_birth, :referal, :religion, :school, :workshop, :latitude, :longitude
  belongs_to :user
end
