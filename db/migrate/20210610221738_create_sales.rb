class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :payment_type, null: false
      t.integer :quantity_product, null: false
      t.string :name_client, null: false
      t.string :phone_client, null: false
      t.string :street, null: false
      t.string :number, null: false

      t.timestamps
    end
  end
end
