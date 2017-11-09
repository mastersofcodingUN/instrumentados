class AddCourseToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :course_id, :integer
  end
end
