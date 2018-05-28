class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string  :spark_id
      t.string  :mls_id
      t.decimal :list_price
      t.string  :address
      t.decimal :total_baths
      t.decimal :total_beds
      t.decimal :garage_spaces
      t.decimal :lot_size
      t.decimal :sqft

      t.timestamps
    end
  end
end
