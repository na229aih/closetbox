class CreateCoordinateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinate_items do |t|
      t.references :item, foreign_key: true
      t.references :coordinate, foreign_key: true
      t.timestamps
    end
  end
end
