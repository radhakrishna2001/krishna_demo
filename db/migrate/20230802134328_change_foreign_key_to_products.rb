class ChangeForeignKeyToProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :Company_id
  end
end
