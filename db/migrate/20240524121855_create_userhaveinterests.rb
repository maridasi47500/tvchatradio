class CreateUserhaveinterests < ActiveRecord::Migration[7.1]
  def change
    create_table :userhaveinterests do |t|
      t.integer :user_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
