class CreateReviewsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews_lists do |t|
      t.integer :review_id
      t.integer :list_id
    end
  end
end
