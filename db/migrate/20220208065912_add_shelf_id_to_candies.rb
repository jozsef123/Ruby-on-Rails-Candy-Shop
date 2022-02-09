class AddShelfIdToCandies < ActiveRecord::Migration[7.0]
  def change
    add_column :candies, :shelf_id, :integer
    add_index :candies, :shelf_id
  end
end
