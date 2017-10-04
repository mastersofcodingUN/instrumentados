class AddCourseIdToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :course_id, :integer
    add_column :courses, :state, :string , default: "INACTIVO"
  end
end
