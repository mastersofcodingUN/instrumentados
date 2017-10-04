class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :reputation, default: 0
      t.string :difficulty
      t.integer :views, default: 0
      t.string :genre
      t.string :instrument
      t.string :image
      
      t.timestamps
    end
  end
end
