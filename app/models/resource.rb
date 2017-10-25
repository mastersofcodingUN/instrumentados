# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  name       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true
	belongs_to :lesson, optional: true
end
