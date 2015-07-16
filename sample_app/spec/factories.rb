FactoryGirl.define do
  factory :user do
    sequence(:name)  { |i| "Person #{i}" }
    sequence(:email) { |i| "person_#{i}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'
  end
end
