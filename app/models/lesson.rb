# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class Lesson < ApplicationRecord
	has_many :resources, dependent: :destroy	
	belongs_to :course, optional: true

	validates :resources, presence: true
	accepts_nested_attributes_for :resources
	#validates_associated :resources
end
