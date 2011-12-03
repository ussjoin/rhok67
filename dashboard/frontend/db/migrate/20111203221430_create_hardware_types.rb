class CreateHardwareTypes < ActiveRecord::Migration
  def change
    create_table :hardware_types do |t|
      t.string :name
      t.string :icon
    end
  end
end
