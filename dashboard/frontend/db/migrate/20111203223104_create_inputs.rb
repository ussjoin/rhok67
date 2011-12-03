class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.references :sensor
      t.float :value
      t.timestamp :when
    end
    add_index :inputs, :when
  end
end
