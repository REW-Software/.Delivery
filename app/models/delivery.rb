class Delivery < ApplicationRecord
  has_one :sale
  has_one :user

  validates :name_delivery_man, presence: true
  enum status: [:progress, :concluded]
end