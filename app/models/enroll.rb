# == Schema Information
#
# Table name: enrolls
#
#  id         :integer          not null, primary key
#  admin      :boolean          default(FALSE)
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enroll < ApplicationRecord
	belongs_to :course
	belongs_to :user

	def self.searchingRoll(attrib, params, id)
		where(attrib,params,id)
	end
end
