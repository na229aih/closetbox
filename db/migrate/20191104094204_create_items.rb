class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :image, null: false
      t.string :category, null: false
      t.string :size
      t.string :brand
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
