class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :owner_name
      t.string :address

      t.timestamps
    end
  end
end
