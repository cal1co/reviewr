class CreateListsReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :lists_reviews do |t|
      t.integer :review_id
      t.integer :list_id
    end
  end
end
