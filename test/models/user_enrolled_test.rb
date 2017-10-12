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

require 'test_helper'

class UserEnrolledTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
