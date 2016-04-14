# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#Create 10 items
10.times do
    user = User.new(email: "#{Faker::Name.first_name}@example.com", password: "password")
   #user.skip_confirmation!
    user.save!
end

users = User.all

50.times do
    Item.create(user: users.sample, description: Faker::Lorem.word)
end

puts "Seed finished"
puts "#{Item.count} items created"
puts "#{User.count} users created"
