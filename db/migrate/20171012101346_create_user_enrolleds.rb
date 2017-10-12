class CreateUserEnrolleds < ActiveRecord::Migration[5.1]
  def change
    create_table :user_enrolleds do |t|
      t.boolean :admin
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
