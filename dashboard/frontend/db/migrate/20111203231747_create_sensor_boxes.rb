class CreateSensorBoxes < ActiveRecord::Migration
  def change
    create_table :sensor_boxes, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.string :serial
      t.references :system
    end
  end
end
