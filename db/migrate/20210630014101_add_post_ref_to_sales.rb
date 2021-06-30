class AddPostRefToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :post, null: false, foreign_key: true
  end
end
