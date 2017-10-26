class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, force: true do |t|
      t.text :text
      t.integer :score
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
