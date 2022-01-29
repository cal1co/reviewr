class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :image
      t.string :strength
      t.string :weakness
      t.text :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
