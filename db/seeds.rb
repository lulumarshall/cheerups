# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
User.create!(username:  "Example User",
             email: "example@cheerup.org",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@cheerup.org"
  password = "password"
  User.create!(username:             name,
              email:                 email,
              password:              password,
              password_confirmation: password)
end

# Cheers
User.order(:created_at).take(6).each do |user|
  50.times do
    user.cheers.create!(cheerup: Faker::Lorem.characters(141))
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
