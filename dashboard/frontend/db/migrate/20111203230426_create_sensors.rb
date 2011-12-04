class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.references :sensor_box
      t.references :hardware_type
      t.references :unit_type
    end
  end
end
