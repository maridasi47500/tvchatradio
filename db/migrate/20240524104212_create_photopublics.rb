class CreatePhotopublics < ActiveRecord::Migration[7.1]
  def change
    create_table :photopublics do |t|
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
