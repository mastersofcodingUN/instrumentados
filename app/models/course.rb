# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  reputation  :integer          default(0)
#  difficulty  :string
#  views       :integer          default(0)
#  genre       :string
#  instrument  :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  state       :string           default("INACTIVO")
#

class Course < ApplicationRecord
	has_many :lessons, dependent: :destroy
	has_many :enrolls
	has_many :users, through: :enrolls

	accepts_nested_attributes_for :lessons
	validates :name, :description, :reputation, :difficulty, :views, presence: true
	validates :reputation, :views, numericality: { only_integer: true }
	validates :genre, inclusion: {in: %w(rock clasica jazz latina electronica pop otro), message: "%{value} o es un genero válido" }
	validates :difficulty, inclusion: {in: %w(Principiante Intermedio Avanzado), message: "%{value} no es una dificultad válida"}
	#validates_associated :lessons
	validate :check_status



	def check_status
  		unless self.state == "ACTIVO" or self.state == "INACTIVO"
  			errors.add(:state, "El estado no es válido")
  		end
	end

	def self.filter_by_genre(gen)
		@genre = self.where(genre: gen)
		return @genre
	end

	def self.search(search, gen, inst)
		if search != "" or gen != "" or inst != "" 
			@nullSearch = false
			where(["name LIKE ? AND genre LIKE ? AND instrument LIKE ?","%#{search}%", "%#{gen}%", "%#{inst}%"])
		else
			@nullSearch = true
			all
		end
	end

	def self.most_purchased
	  group("courses.id")
		.order("searches desc").limit(10)
		.pluck("name", "searches")
	end

end
