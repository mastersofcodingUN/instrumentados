require 'test_helper'

class EnrollTest < ActiveSupport::TestCase

  test "metodo searchingRoll" do
    @user = User.first
    @course = Course.first
    @rol = Enroll.searchingRoll("course_id = ? AND user_id = ?", [@course.id, @user.id], @user.id)
  end
end
