class AddShopIdToShelves < ActiveRecord::Migration[7.0]
  def change
    add_column :shelves, :shop_id, :integer
    add_index :shelves, :shop_id
  end
end
