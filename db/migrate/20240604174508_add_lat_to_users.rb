class AddLatToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lat, :string
    add_column :users, :lon, :string
  end
end
