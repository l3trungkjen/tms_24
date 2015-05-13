FactoryGirl.define do
  factory :task do
    subject
    sequence(:name) {|i| "name#{i}"}
    sequence(:description) {|i| "description#{i}"}
    sequence(:content) {|i| "content#{i}"}
  end

  factory :subject do
    sequence(:name) {|i| "name#{i}"}
    sequence(:length) {1}
    sequence(:description) {|i| "description#{i}"}
  end

  factory :course do
    name {Faker::Name.name}
    sequence(:length) {1}
    sequence(:description) {|i| "description#{i}"}
  end

  factory :user do
    sequence(:name) {|i| "name#{i}"}
    sequence(:email) {|i| "email#{i}@gmail.com"}
    sequence(:password) {|i| "password#{i}"}
  end

  factory :course_subject do
    course
    subject
  end
end
