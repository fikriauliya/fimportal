class ProfileCandidate < ActiveRecord::Base
  attr_accessible :application_count, :batch, :blood_type, :committee, :dob, :fullname, :gender, 
    :hobby, :information_from, :location, :motivation, :non_formal_education, :organization, 
    :performance_type, :phone, :place_of_birth, :referal, :religion, :school, :workshop, 
    :latitude, :longitude, :agreement, :photo, :recommendation_letter, :collaboration, 
    :inspiring_story, :province, :is_announcement_displayed, :commit_agreement, 
    :is_committed_to_central_fim, :is_committed_to_regional_fim, :is_committed_to_own_organization, :choose_type, :food_except
    
  attr_accessible :status, :submitted_at, :as => :confirmation_step
  
  attr_accessible :biodata, :is_photo_visible_to_public, :is_visible_to_public,
   :facebook, :twitter, :is_email_displayed, :as => :additional_fields
   
  attr_accessible :marked_by, 
    :organization_point, :committee_point, :personal_knowledge_point, :document_completeness_point,
    :reliability_point, :willingness_point, 
    :special_location_comment, :special_character_comment, :status,
    :school,
    :as => :recruiter
    
  attr_accessible :workshop, :is_update_allowed, :status, :as => :update_workshop
  
  belongs_to :user
  belongs_to :marked_by, :class_name => "User"
  
  validates :application_count, :batch, :blood_type, :dob, :fullname, :gender, 
    :information_from, :location, :phone, :place_of_birth, :religion, 
    :school, :agreement, :province, :presence => true

    #Temporarily not checked :inspiring_story,  :motivation, :collaboration
    
  # validates_length_of :motivation, :maximum => 200, :too_long => "Terlalu panjang, melebihi 200 kata", :tokenizer => lambda {|str| str.scan(/\S+/) }
  # validates_length_of :inspiring_story, :maximum => 500, :too_long => "Terlalu panjang, melebihi 500 kata", :tokenizer => lambda {|str| str.scan(/\S+/) }
  # validates_length_of :collaboration, :maximum => 200, :too_long => "Terlalu panjang, melebihi 200 kata", :tokenizer => lambda {|str| str.scan(/\S+/) }
  validates_length_of :biodata, :too_long => 'Terlalu panjang, melebihi 160 karakter', :maximum => 160
  
  validates_length_of :fullname, :place_of_birth, :religion, :phone, :blood_type, :school, :information_from, :photo, :recommendation_letter, :status, :province, :facebook, :twitter, :maximum => 255
  
  # validates_format_of :agreement, :with => lambda {|me|
     # /\s*Saya,\s*\[?\s*#{me.fullname.nil? ? '' : me.fullname.strip}\s*\]? \s*menyatakan bahwa keterangan di atas diisi dengan sebenar-benarnya dan saya bersedia mengikuti seluruh rangkaian kegiatan pelatihan FIM 15 pada tanggal 27 Oktober - 3 November 2013\s*/i
   # }, :message => "<p>Tidak sama dengan contoh di atas. Coba periksa apakah [Nama Anda] terisi dengan benar (sama dengan nama lengkap yang Anda cantumkan di atas). Untuk mengurangi kemungkinan kesalahejaan, Anda bisa menggunakan fitur copy-paste dan mengubah [Nama Anda] dengan nama lengkap Anda.</p><p>Contoh:</p><p>Saya, <b>Agus Widodo</b> menyatakan bahwa keterangan di atas diisi dengan sebenar-benarnya dan saya bersedia mengikuti seluruh rangkaian kegiatan pelatihan FIM 15 pada tanggal 27 Oktober - 3 November 2013"
   
  def self.submitted
    where("status = 'SUBMITTED' or status = 'MARKED'")
  end
  
  def self.chronological
    order("submitted_at ASC")
  end
    
  def self.all_school
    ['Institut Manajemen Telkom', 'Institut Pertanian Bogor', 'Institut Teknologi Bandung', 
      'Institut Teknologi Sepuluh Nopember', 'Institut Teknologi Telkom', 'Sampoerna School of Education', 
      'Sekolah Tinggi Akuntansi Negara', 'Sekolah Tinggi Ekonomi Islam Tazkia', 'STMIK Amikom', 'Universitas Airlangga', 
      'Universitas Al Azhar Indonesia', 'Universitas Andalas', 'Universitas Bakrie', 'Universitas Bangka Belitung', 
      'Universitas Bengkulu', 'Universitas Brawijaya', 'Universitas Cendrawasih', 'Universitas Diponegoro', 
      'Universitas Gadjah Mada', 'Universitas Haluoleo', 'Universitas Hasanuddin', 'Universitas Indonesia',
      'Universitas Islam Negeri Alauddin', 'Universitas Islam Negeri Syarif Hidayatullah', 'Universitas Jambi', 
      'Universitas Jember', 'Universitas Jenderal Soedirman', 'Universitas Khairun', 'Universitas Lambung Mangkurat', 
      'Universitas Lampung', 'Universitas Muhammadiyah Makassar', 'Universitas Muhammadiyah Malang', 
      'Universitas Muhammadiyah Purwokerto', 'Universitas Muhammadiyah Yogyakarta', 'Universitas Mulawarman', 
      'Universitas Multimedia Nusantara', 'Universitas Negeri Gorontalo', 'Universitas Negeri Jakarta', 
      'Universitas Negeri Makassar', 'Universitas Negeri Malang', 'Universitas Negeri Manado', 
      'Universitas Negeri Medan', 'Universitas Negeri Padang', 'Universitas Negeri Papua', 
      'Universitas Negeri Semarang', 'Universitas Negeri Surabaya', 'Universitas Sebelas Maret Surakarta', 
      'Universitas Negeri Yogyakarta', 'Universitas Nusa Cendana', 'Universitas Padjadjaran', 
      'Universitas Palangka Raya', 'Universitas Paramadina', 'Universitas Pattimura', 'Universitas Pendidikan Ganesha', 
      'Universitas Pendidikan Indonesia', 'Universitas Riau', 'Universitas Sam Ratulangi', 'Universitas Sriwijaya', 
      'Universitas Sultan Ageng Tirtayasa', 'Universitas Sumatera Utara', 'Universitas Syiah Kuala', 
      'Universitas Tadulako', 'Universitas Tanjungpura', 'Universitas Trisakti', 'Universitas Udayana', 'Nanyang Technological University']
  end
  
  def self.all_province
    ["Aceh", "Bali", "Banten", "Bengkulu", "Gorontalo", "Jakarta", "Jambi", "Jawa Barat", "Jawa Tengah", "Jawa Timur", 
      "Kalimantan Barat", "Kalimantan Selatan", "Kalimantan Tengah", "Kalimantan Timur", "Kalimantan Utara", 
      "Kepulauan Bangka Belitung", "Kepulauan Riau", "Lampung", "Maluku", "Maluku Utara", "Nusa Tenggara Timur", 
      "Nusa Tenggara Barat", "Papua", "Papua Barat", "Riau", "Sulawesi Barat", "Sulawesi Selatan", "Sulawesi Tengah", 
      "Sulawesi Tenggara", "Sulawesi Utara", "Sumatera Barat", "Sumatera Selatan", "Sumatera Utara", "Yogyakarta"] 
  end
  
  def facebook_url
    if facebook? && !facebook.match(/facebook.com/)
      'http://www.facebook.com/' + facebook
    elsif facebook?
      facebook
    else
      '-'
    end
  end
  
  def cv_total_point
    ((30 * organization_point + 30 * committee_point + 30 * personal_knowledge_point + 10 * document_completeness_point)/100.0).round(2)
  end
  
  def motivation_total_point
    ((50 * reliability_point + 50 * willingness_point)/100.0).round(2)
  end
  
  def total_point
    ((65 * cv_total_point + 35 * motivation_total_point)/100.0).round(2)
  end
  
  def self.to_alphabet(point)
    case point
    when 0
      'E'
    when 1
      'D'
    when 2
      'C'
    when 3
      'B'
    when 4
      'A'
    else
      'E'
    end
  end
  
  def self.from_alphabet(alp)
    case alp
    when 'E'
      0
    when 'D'
      1
    when 'C'
      2
    when 'B'
      3
    when 'A'
      4
    else
      0
    end
  end
end
