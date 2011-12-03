class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.references :controller
      t.references :hardware_type
      t.references :unit_type
    end
  end
end
