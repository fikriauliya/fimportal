# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile_candidate do
    fullname "MyString"
    dob "2013-02-18"
    place_of_birth "MyString"
    location "MyString"
    gender ""
    religion "MyString"
    phone "MyString"
    email "MyString"
    hobby "MyString"
    blood_type "MyString"
    school "MyString"
    batch 1
    non_formal_education "MyText"
    organization "MyText"
    committee "MyText"
    workshop "MyText"
    motivation "MyText"
    information_from "MyString"
    application_count 1
    performance_type "MyString"
    referal "MyString"
  end
end
