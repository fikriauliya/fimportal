class CreateProvinceQuota < ActiveRecord::Migration
  def change
    create_table :province_quota do |t|
      t.string :province_name
      t.integer :quota_for_cibubur, :default => 0

      t.timestamps
    end
    
    a = [["Aceh", 2], ["Bali", 4], ["Banten", 2], ["Bengkulu", 2], 
      ["Gorontalo", 1], ["Jakarta", 14], ["Jambi", 1], ["Jawa Barat", 22], ["Jawa Tengah", 10], 
      ["Jawa Timur", 20], ["Kalimantan Barat", 2], ["Kalimantan Selatan", 2], 
      ["Kalimantan Tengah", 1], ["Kalimantan Timur", 2], ["Kalimantan Utara", 100], 
      ["Kepulauan Bangka Belitung", 1], ["Kepulauan Riau", 1], ["Lampung", 2], ["Maluku", 1], ["Maluku Utara", 100], 
      ["Nusa Tenggara Timur", 1], ["Nusa Tenggara Barat", 1], ["Papua", 2], ["Papua Barat", 100], ["Riau", 2], 
      ["Sulawesi Barat", 1], ["Sulawesi Selatan", 2], ["Sulawesi Tengah", 1], ["Sulawesi Tenggara", 1], 
      ["Sulawesi Utara", 100], ["Sumatera Barat", 3], ["Sumatera Selatan", 3], ["Sumatera Utara", 2], ["Yogyakarta", 9],
      ["Luar negeri", 2]] 
    a.each{|e| ProvinceQuota.create(:province_name => e[0], :quota_for_cibubur => e[1])}
  end
end
