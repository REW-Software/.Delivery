class CreateDeliveryMen < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_men do |t|
      t.delivery :delivery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
