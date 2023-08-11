class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :build
      t.string :price
      t.string :address
      t.string :age
      t.text :remarks

      t.timestamps
    end
  end
end
