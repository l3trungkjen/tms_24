FactoryGirl.define do
  factory :subject do
    name {Faker::Name.name}
    description {Faker::Lorem.user_subjects}
  end

  factory :course do
    name {Faker::Name.name}
  end
end