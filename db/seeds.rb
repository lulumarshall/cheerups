# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :description, :role, :image 

User.create(email: "ben@sunderland.eu.com", password: "password", password_confirmation: "password", username: "ben", description: "coder", role: "guest")