class Profile < ActiveRecord::Base
  attr_accessible :batch, :dob, :fullname, :interest, :location, :latitude, :longitude, 
    :motto, :place_of_birth, :program, :facebook, :twitter, :is_email_displayed
    
  validates :fullname, :batch, :presence => true
  belongs_to :user
  
  def facebook_url
    if facebook? && !facebook.match(/facebook.com/)
      'http://www.facebook.com/' + facebook
    elsif facebook?
      facebook
    else
      '-'
    end
  end
end
