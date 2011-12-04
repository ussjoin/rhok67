class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.references :company
    end
  end
end
