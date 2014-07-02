namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ben Burke",
                 email: "bburke@railstutorial.org",
                 password: "barkley",
                 password_confirmation: "barkley",
                 admin: true)
    
    Team.create!(name: "Bulldogs")

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    99.times do |n|
      name  = Faker::Name.name
      Team.create!(name: name)
    end 

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.wallposts.create!(content: content) }
    end
  end
end