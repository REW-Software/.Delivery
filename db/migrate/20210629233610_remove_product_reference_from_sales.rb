class RemoveProductReferenceFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_reference :sales, :product, null: false, foreign_key: true
    remove_column :sales, :product_quantity
  end
end
