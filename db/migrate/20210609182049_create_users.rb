class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth
      t.string :email
      t.string :cpf
      t.string :rg
      t.string :street
      t.string :number
      t.string :tipo

      t.timestamps
    end
  end
end
