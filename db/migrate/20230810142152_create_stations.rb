class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :line
      t.string :station
      t.string :distance
      t.references :buildings, null: false, foreign_key: true

      t.timestamps
    end
  end
end
