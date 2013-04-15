# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :province_quotum, :class => 'ProvinceQuota' do
    province_name "MyString"
    quota_for_cibubur 1
  end
end
