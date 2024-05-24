class CreatePhotoprives < ActiveRecord::Migration[7.1]
  def change
    create_table :photoprives do |t|
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
