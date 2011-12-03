class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.references :sensor
      t.float :value
      t.datetime :when
    end
  end
end
