class Post < ApplicationRecord
  has_one :sale
  has_one :user

  enum status: [:progress, :concluded]
end