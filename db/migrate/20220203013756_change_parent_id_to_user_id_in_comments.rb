class ChangeParentIdToUserIdInComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :parent_id, :user_id
  end
end
