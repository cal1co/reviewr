class ChangeDefaultLikesToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :likes, :integer, deafult: 0
  end
end
