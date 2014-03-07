class ActivistProfile < ActiveRecord::Base
  attr_accessible :activity1_information, :activity1_reason, :activity2_information, 
  	:activity2_reason, :activity3_information, :activity3_reason, :activity4_information, 
  	:activity4_reason, :activity5_information, :activity5_reason, :essay_about_pasca_training, 
  	:tipografi

  belongs_to :user

  validates :activity1_information, :activity1_reason, :activity2_information, 
  	:activity2_reason, :activity3_information, :activity3_reason, :activity4_information, 
  	:activity4_reason, :activity5_information, :activity5_reason, :essay_about_pasca_training, 
  	:tipografi, :presence => true

  validates_length_of :activity1_reason, :activity2_reason, :activity3_reason, :activity4_reason, 
  	:activity5_reason, :too_long => 'Terlalu panjang, melebihi 350 karakter', :maximum => 350

  validates_length_of :essay_about_pasca_training, :too_long => 'Terlalu panjang, melebihi 1000 kata', :maximum => 1000, :tokenizer => lambda {|str| str.scan(/\S+/) }
end
