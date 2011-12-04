class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies, :options => "DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci" do |t|
      t.string :name
      t.string :account
      t.string :phone
    end
  end
end
