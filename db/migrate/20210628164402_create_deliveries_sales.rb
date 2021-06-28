class CreateDeliveriesSales < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries_sales do |t|
      t.integer :status
      t.references :sale, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
