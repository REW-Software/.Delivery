class Post < ApplicationRecord
  has_many :sales, dependent: :destroy

  enum status: [:progress, :concluded]
end