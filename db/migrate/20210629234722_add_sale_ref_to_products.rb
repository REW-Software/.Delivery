class AddSaleRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :sale, null: true, foreign_key: true
    add_column :products, :quantity_product, :integer
  end
end
