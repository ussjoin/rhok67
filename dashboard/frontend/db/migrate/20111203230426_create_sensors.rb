class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.references :sensor_box
      t.references :hardware_type
      t.references :unit_type
    end
  end
end
