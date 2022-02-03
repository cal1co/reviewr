class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :reply
      t.integer :review_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
