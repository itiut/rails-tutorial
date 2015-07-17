namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    User.create!(name: 'Example User',
                 email: 'example@railstutorial.jp',
                 password: 'foobar',
                 password_confirmation: 'foobar',
                 admin: true)
    99.times do |i|
      name = Faker::Name.name
      email = "example-#{i+1}@railstutorial.jp"
      password = 'password'
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each do |user|
        user.microposts.create!(content: content)
      end
    end
  end
end
