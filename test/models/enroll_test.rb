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

require 'test_helper'

class EnrollTest < ActiveSupport::TestCase

  test "metodo searchingRoll" do
    @user = User.first
    @course = Course.first
    @rol = Enroll.searchingRoll("course_id = ? AND user_id = ?", [@course.id, @user.id], @user.id)
  end
end
