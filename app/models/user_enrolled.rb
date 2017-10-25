# == Schema Information
#
# Table name: user_enrolleds
#
#  id         :integer          not null, primary key
#  admin      :boolean
#  user_id    :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserEnrolled < ApplicationRecord
	belongs_to :course, optional: true
	belongs_to :user, optional: true
	has_many :comments
	has_many :questions
end
