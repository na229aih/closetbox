class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, index: true
      t.integer :coordinate_id, null: false, index: true
      t.timestamps
      t.index [:user_id, :coordinate_id], unique: true
    end
  end
end
