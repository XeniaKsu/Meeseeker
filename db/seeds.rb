require 'faker'
require 'json'
require 'open-uri'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Booking.delete_all
Meeseek.delete_all
User.destroy_all

puts "I'm a load of Mr Meeseeks, look at me (populating)"

# create 20 users
# for each user, create a meeseek
# users need to have an email and a password

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "I'm #{user.email} and I need help"

  file = URI.open("https://lh3.googleusercontent.com/8qqfvSBi16sicHTCbC-Gcr73fSNF4SN0bI_8fWVasJW2PHTuCuUTh4Ypnii5wg5q34PLiFfMJC2K0VOFE8pynrG76GkoWSs7jxfRmg=w600")
  meeseek = Meeseek.new(
    postcode: JSON.parse(URI.open('https://api.postcodes.io/random/postcodes').read)["result"]["postcode"],
    user_id: user.id
  )
  meeseek.photo.attach(io: file, filename: "meeseek_seed.png", content_type: "image/png")
  meeseek.save

  puts "I'm Mr Meeseeks, look at me! I'm here to help #{user}"
end

puts "I'm done"
