class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :name
      t.string :serial
      t.references :system
    end
  end
end
