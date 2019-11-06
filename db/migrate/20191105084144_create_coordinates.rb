class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
