class CreateEnrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolls do |t|
      t.boolean :admin, default: false
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end
