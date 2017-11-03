# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  name       :string
#  attachment :string
#  lesson_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true
	belongs_to :lesson, optional: true

	def self.returnAll
		all
	end

	def self.finding(params)
		find(params)
	end

end
