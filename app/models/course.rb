class Course < ApplicationRecord
	has_many :lessons, dependent: :destroy

	accepts_nested_attributes_for :lessons	
	validates :name, :description, :reputation, :difficulty, :views, presence: true
	validates :reputation, :views, numericality: { only_integer: true }
	#validates_associated :lessons
	validate :check_status

	def check_status  		
  		unless self.state == "ACTIVO" or self.state == "INACTIVO"
  			errors.add(:state, "El estado no es válido")
  		end
	end
end
