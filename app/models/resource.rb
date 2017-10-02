class Resource < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true
	belongs_to :lesson, optional: true
end
