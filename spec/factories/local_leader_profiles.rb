# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :local_leader_profile do
    organization_information "MyText"
    essay_about_organization "MyText"
    user_id 1
  end
end
