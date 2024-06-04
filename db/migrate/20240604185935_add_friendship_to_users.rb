class AddFriendshipToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :friendship, :boolean
    add_column :users, :fun, :boolean
    add_column :users, :serious, :boolean
  end
end
