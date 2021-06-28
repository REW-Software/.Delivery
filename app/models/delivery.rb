class Delivery < ApplicationRecord
  has_one :sale
  has_one :delivery_man

  validates :name_delivery_man, presence: true
end
