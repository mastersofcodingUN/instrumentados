# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
password = "password"
difficulty = ["Principiante","Intermedio", "Avanzado"]
genre = ["Rock","Clásica","Pop","Metal","Ranchera","Jazz"]

100.times do
	User.create([{
		email: Faker::Internet.email,
		password: password,
	    password_confirmation: password,
		country: Faker::Address.country,
		birthdate: Faker::Date.between(100.year.ago, 5.year.ago),
		name: Faker::Name.name 
		}])

	Course.create([{
		name: Faker::Name.title,
		description: Faker::Lorem.paragraph,
		reputation: Faker::Number.between(1, 5).to_i,
		difficulty: difficulty.sample,
		views: Faker::Number.between(1, 100000).to_i,
		genre: genre.sample,
		instrument: Faker::Music.instrument	}])	
	
	end

