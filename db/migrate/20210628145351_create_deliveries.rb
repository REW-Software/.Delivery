class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.sale :sale, null: false, foreign_key: true
      t.delivery_man :delivery_man, null: false, foreign_key: true

      t.timestamps
    end
  end
end
