FactoryGirl.define do
  factory :user do
    sequence(:name)  { |i| "Person #{i}" }
    sequence(:email) { |i| "person_#{i}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content 'Lorem ipsum'
    user
  end
end
