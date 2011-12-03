class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.references :building
      t.references :system_type
    end
  end
end
