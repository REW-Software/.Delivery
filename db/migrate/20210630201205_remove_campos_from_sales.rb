class RemoveCamposFromSales < ActiveRecord::Migration[6.1]
  def change
    remove_column :sales, :street, :string
    remove_column :sales, :number, :string
    remove_column :sales, :phone_client, :string
  end
end
