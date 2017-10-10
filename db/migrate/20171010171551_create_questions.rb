class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
