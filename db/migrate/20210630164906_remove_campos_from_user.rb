class RemoveCamposFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :street, :string
    remove_column :users, :number, :string
    rename_column :users, :tipo, :type
  end
end
