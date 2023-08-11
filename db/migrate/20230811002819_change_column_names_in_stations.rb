class ChangeColumnNamesInStations < ActiveRecord::Migration[6.0]
  def change
    rename_column :stations, :buildings_id, :building_id
  end
end
