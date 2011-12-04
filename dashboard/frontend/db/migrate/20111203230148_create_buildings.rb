class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.references :facility
    end
  end
end
