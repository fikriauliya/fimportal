class CreateInstituteQuota < ActiveRecord::Migration
  def change
    create_table :institute_quota do |t|
      t.string :institute_name
      t.integer :quota_for_cibubur, :default => 0

      t.timestamps
    end
    
    a = [["Universitas Indonesia", 8],
          ["Institut Teknologi Bandung", 5],
          ["Institut Pertanian Bogor", 11],
          ["Universitas Padjadjaran", 7],
          ["Universitas Diponegoro", 4],
          ["Universitas Sebelas Maret Surakarta", 4],
          ["Universitas Gadjah Mada", 10],
          ["Universitas Brawijaya", 8],
          ["Institut Teknologi Sepuluh Nopember", 9]
        ]
    a.each{|e| InstituteQuota.create(:institute_name => e[0], :quota_for_cibubur => e[1])}
  end
end
