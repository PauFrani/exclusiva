class ChangeNameToCustumerIdInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :mp_costumer_id, :mp_customer_id
  end
end
