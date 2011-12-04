class CreateHardwareTypes < ActiveRecord::Migration
  def change
    create_table :hardware_types, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.string :icon
    end
  end
end
