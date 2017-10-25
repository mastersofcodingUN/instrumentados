class AddSearchesToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :searches, :integer, default: 0
  end
end
