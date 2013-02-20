class ProfileCandidate < ActiveRecord::Base
  attr_accessible :application_count, :batch, :blood_type, :committee, :dob, :fullname, :gender, 
    :hobby, :information_from, :location, :motivation, :non_formal_education, :organization, 
    :performance_type, :phone, :place_of_birth, :referal, :religion, :school, :workshop, 
    :latitude, :longitude, :agreement, :biodata, :photo
  belongs_to :user
  
  validates :application_count, :batch, :blood_type, :dob, :fullname, :gender, 
    :information_from, :location, :motivation, :phone, :place_of_birth, :religion, 
    :school, :latitude, :longitude, :agreement, :photo, :presence => true
    
  validates :photo, :attachment_presence => true
  validates :photo, :attachment_size => { :in => 0..200.kilobytes }  
    
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
