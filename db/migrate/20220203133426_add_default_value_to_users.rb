class AddDefaultValueToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :setimage, :boolean, default:false
  end
end
