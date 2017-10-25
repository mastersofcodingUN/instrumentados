# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
    belongs_to :course
    belongs_to :user_enrolled
    has_many :comments, dependent: :destroy
end
