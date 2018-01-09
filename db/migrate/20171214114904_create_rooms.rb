class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :rules
      t.string :address
      t.string :image
      t.string :latitude
      t.string :longitude
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
