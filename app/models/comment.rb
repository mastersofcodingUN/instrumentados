# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  question_id    :integer
#  course_id      :integer
#  user_id        :integer
#  content        :text
#  score          :integer
#  isforumcomment :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :question
    belongs_to :user_enrolled
end
