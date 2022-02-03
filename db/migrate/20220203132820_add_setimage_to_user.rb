class AddSetimageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :setimage, :boolean
  end
end
