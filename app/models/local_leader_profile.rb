class LocalLeaderProfile < ActiveRecord::Base
  attr_accessible :essay_about_organization, :organization_information

  belongs_to :user

  validates :essay_about_organization, :organization_information, :presence => true
end
