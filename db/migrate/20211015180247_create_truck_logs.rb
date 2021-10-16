class CreateTruckLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_logs do |t|
      t.st_point :geom, geographic: true
      t.float :latitude
      t.float :longitude
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
