class RemoveSaleReferenceFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posts, :sale, null: false, foreign_key: true
  end
end
