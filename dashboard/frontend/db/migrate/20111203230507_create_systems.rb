class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.references :building
      t.references :system_type
    end
  end
end
