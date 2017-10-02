class Lesson < ApplicationRecord
	has_many :resources, dependent: :destroy
	validates :resources, presence: true

	accepts_nested_attributes_for :resources

	validates_associated :resources
end
