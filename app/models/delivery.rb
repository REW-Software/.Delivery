class Delivery < ApplicationRecord
  has_one :sale
  has_one :user

  validates :name_delivery_man, presence: true
  validates :status, presence: true
end