class ChangeColumnNameInShowroom < ActiveRecord::Migration[5.2]
  def change
    rename_column :showrooms, :phone_mumber, :phone_number
  end
end
