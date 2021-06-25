class Sale < ApplicationRecord
  has_many :product, class_name: "Product", foreign_key: "product_id"

  enum payment_type: [:money, :card]

  validates :quantity_product, presence: true, numericality: { greater_than: 0 }
  validates :name_client, presence: true, length: { minimum: 4 }
  validates :phone_client, presence: true, length: { minimun: 11, maximum: 15 }
  validates :street, presence: true, length: { minimun: 5, maximum: 50 }
  validates :number, presence: true, length: { minimun: 1, maximum: 10 }
end
