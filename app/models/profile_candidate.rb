class ProfileCandidate < ActiveRecord::Base
  attr_accessible :application_count, :batch, :blood_type, :committee, :dob, :fullname, :gender, 
    :hobby, :information_from, :location, :motivation, :non_formal_education, :organization, 
    :performance_type, :phone, :place_of_birth, :referal, :religion, :school, :workshop, 
    :latitude, :longitude, :agreement, :photo, :recommendation_letter, :collaboration, 
    :inspiring_story, :province
  
  attr_accessible :biodata, :is_photo_visible_to_public, :is_visible_to_public, :as => :additional_fields
  
  belongs_to :user
  
  validates :application_count, :batch, :blood_type, :dob, :fullname, :gender, 
    :information_from, :location, :motivation, :phone, :place_of_birth, :religion, 
    :school, :agreement, :inspiring_story, :collaboration, :province, :presence => true
    
  validates_length_of :motivation, :maximum => 200, :tokenizer => lambda {|str| str.scan(/\w+/) }
  validates_length_of :inspiring_story, :maximum => 500, :tokenizer => lambda {|str| str.scan(/\w+/) }
  validates_length_of :collaboration, :maximum => 200, :tokenizer => lambda {|str| str.scan(/\w+/) }
  validates_length_of :biodata, :maximum => 160
  
  validates_format_of :agreement, :with => lambda {|me|
     /\s*Saya,\s*\[?\s*#{me.fullname}\s*\]? \s*menyatakan bahwa keterangan di atas diisi dengan sebenar-benarnya dan saya bersedia mengikuti seluruh rangkaian kegiatan pelatihan FIM 14 pada tanggal 2-5 Mei 2013\s*/i
   }, :message => "Tidak sama dengan contoh di atas. Coba periksa apakah [Nama Anda] terisi dengan benar (sama dengan nama lengkap yang Anda cantumkan di atas)."
   
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
      'Universitas Negeri Semarang', 'Universitas Negeri Surabaya', 'Universitas Negeri Surakarta (Sebelas Maret)', 
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
end
