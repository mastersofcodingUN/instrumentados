class Contact < ApplicationRecord

  validates :name, :mail, :content, presence: true

end
