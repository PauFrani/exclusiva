class AddAddressableToTables < ActiveRecord::Migration[5.2]
  def change
        add_reference :showrooms, :addressable, polymorphic: true, index: true
        add_reference :biddings, :addressable, polymorphic: true, index: true
        add_reference :users, :addressable, polymorphic: true, index: true
  end
end
