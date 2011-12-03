class CreateSensorBoxes < ActiveRecord::Migration
  def change
    create_table :sensor_boxes do |t|
      t.string :name
      t.string :serial
      t.references :system
    end
  end
end
