class ChangeLikesToLikeCountInReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :likes, :like_count
  end
end
