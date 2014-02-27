class LocalLeaderProfile < ActiveRecord::Base
  attr_accessible :essay_about_organization, :organization_information

  belongs_to :user

  validates :essay_about_organization, :organization_information, :presence => true

  validates_length_of :essay_about_organization, :too_long => 'Terlalu panjang, melebihi 1000 karakter', :maximum => 1000
end
