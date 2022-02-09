class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
