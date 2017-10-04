class Lesson < ApplicationRecord
	has_many :resources, dependent: :destroy	
	belongs_to :course, optional: true

	validates :resources, presence: true
	accepts_nested_attributes_for :resources
	#validates_associated :resources
end
