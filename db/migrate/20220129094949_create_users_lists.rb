class CreateUsersLists < ActiveRecord::Migration[5.2]
  def change
    create_table :users_lists do |t|
      t.integer :user_id
      t.integer :list_id
    end
  end
end
