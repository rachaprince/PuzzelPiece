namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_wallposts
    make_teams
    make_relationships
  end
end

def make_users
    User.create!(name: "Ben Burke",
                 email: "bburke@railstutorial.org",
                 password: "barkley",
                 password_confirmation: "barkley",
                 admin: true)
    

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
end

def make_teams 
    Team.create!(name: "Bulldogs")

    99.times do |n|
      name  = Faker::Name.name
      Team.create!(name: name)
    end 
end 

def make_wallposts
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.wallposts.create!(content: content) }
    end
end 

def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..50]
      followers      = users[3..40]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
end