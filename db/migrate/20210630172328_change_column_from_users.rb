class ChangeColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :type, :type_user
  end
end
