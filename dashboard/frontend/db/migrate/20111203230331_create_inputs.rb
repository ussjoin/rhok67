class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.references :sensor
      t.float :value
      t.datetime :when
    end
  end
end
