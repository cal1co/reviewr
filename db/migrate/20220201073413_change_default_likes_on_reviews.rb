class ChangeDefaultLikesOnReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :likes, :integer, default: 0
  end
end
