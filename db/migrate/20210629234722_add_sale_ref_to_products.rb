class AddSaleRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :sale, null: true, foreign_key: true
    add_column :products, :product_quantity, :integer
  end
end
