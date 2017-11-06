class Enroll < ApplicationRecord
	belongs_to :course
	belongs_to :user
	has_many :comments

	def self.searchingRoll(attrib, params, id)
		where(attrib,params,id)
	end
end
