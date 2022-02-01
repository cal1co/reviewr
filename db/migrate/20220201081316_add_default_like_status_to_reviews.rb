class AddDefaultLikeStatusToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :like_status, :string
  end
end
