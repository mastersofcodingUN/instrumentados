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

	def self.finding(params)
		find(params)
	end

	def self.getAll
		all
	end

	def self.search(search, gen, inst)
		if not search.blank? or not gen.blank? or not inst.blank?
			cursos = where(["name LIKE ? AND genre LIKE ? AND instrument LIKE ?","%#{search}%", "%#{gen}%", "%#{inst}%"])
			cursos.each do |curso|
				curso.searches = curso.searches + 1
				curso.save
			end
			puts "Ha buscado lo que se le ha pedido"
			return cursos
		else
			puts "No hubo búsqueda"
			all
		end
	end

	def self.most_purchased
	  group("courses.id")
		.order("searches desc").limit(10)
		.pluck("name", "searches")
	end

	def self.most_viewed
		group("courses.id")
		.order("views desc").limit(10)
		.pluck("name", "views")
	end

end
