class Post < ApplicationRecord
  has_many :sales, dependent: :destroy
  belongs_to :user

  enum status: [:progress, :concluded]
end