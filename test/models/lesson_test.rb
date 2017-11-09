# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "metodo search" do
    @curso = Course.first
    @leccion = Lesson.search(course_id: @curso.id)
    assert_equal @leccion, []  #se espera que no encuentre la leccion en el curso
  end

  test "metodo finding" do
    @leccion = Lesson.finding(298486374)
    assert_equal @leccion.title, "MyString"
  end
end
