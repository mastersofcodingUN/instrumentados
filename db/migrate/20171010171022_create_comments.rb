class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :question_id
      t.integer :course_id
      t.integer :user_id
      t.text :content
      t.integer :score
      t.boolean :isforumcomment

      t.timestamps
    end
  end
end
