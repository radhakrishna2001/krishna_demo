class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :company_id, :integer
  end
end
