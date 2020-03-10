class CreateShowrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :showrooms do |t|
      t.string :name
      t.string :phone_mumber
      t.string :email
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
