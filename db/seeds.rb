# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "password"

100.times do
	User.create([{
		email: Faker::Internet.email,
		password: password,
	    password_confirmation: password,
		country: Faker::Address.country,
		birthdate: Faker::Date.between(100.year.ago, 5.year.ago),
		name: Faker::Name.name 
		}])
end