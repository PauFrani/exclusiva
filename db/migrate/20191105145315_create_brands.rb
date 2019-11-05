class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :logo
      t.boolean :status

      t.timestamps
    end
  end
end
