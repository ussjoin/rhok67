class CreateSystemTypes < ActiveRecord::Migration
  def change
    create_table :system_types do |t|
      t.string :name
      t.string :icon
    end
  end
end
