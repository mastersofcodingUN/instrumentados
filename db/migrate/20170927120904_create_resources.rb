class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :attachment
      t.belongs_to :lesson, index: true      
      t.timestamps
    end
  end
end
