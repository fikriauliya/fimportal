# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :institute_quotum, :class => 'InstituteQuota' do
    institute_name "MyString"
    quota_for_cibubur 1
  end
end
