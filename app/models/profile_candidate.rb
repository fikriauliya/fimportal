class ProfileCandidate < ActiveRecord::Base
  attr_accessible :application_count, :batch, :blood_type, :committee, :dob, :fullname, :gender, 
    :hobby, :information_from, :location, :motivation, :non_formal_education, :organization, 
    :performance_type, :phone, :place_of_birth, :referal, :religion, :school, :workshop, 
    :latitude, :longitude, :agreement, :biodata, :photo, :recommendation_letter
  attr_accessible :recommendation_letter, :status, :as => :final_step
  
  belongs_to :user
  
  validates :application_count, :batch, :blood_type, :dob, :fullname, :gender, 
    :information_from, :location, :motivation, :phone, :place_of_birth, :religion, 
    :school, :latitude, :longitude, :agreement, :presence => true
  validates_length_of :motivation, :maximum => 200, :tokenizer => lambda {|str| str.scan(/\w+/) }
  validates_format_of :agreement, :with => lambda {|me|
     /\s*Saya,\s*#{me.fullname} \s*menyatakan bahwa keterangan di atas diisi dengan sebenar-benarnya dan saya bersedia mengikuti seluruh rangkaian kegiatan pelatihan FIM 14 pada tanggal 2-5 Mei 2013\s*/i
   }, :message => "Tidak sama dengan contoh di atas. Coba periksa nama Anda terisi dengan benar."

  mount_uploader :photo, CandidatePhotoUploader
  mount_uploader :recommendation_letter, CandidateRecommendationLetterUploader
end
