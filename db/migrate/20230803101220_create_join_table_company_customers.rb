class CreateJoinTableCompanyCustomers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :companies, :customers do |t|
       t.index [:company_id, :customer_id]
       t.index [:customer_id, :company_id]
    end
  end
end

