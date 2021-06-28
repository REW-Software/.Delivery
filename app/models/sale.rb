class Sale < ApplicationRecord
  has_many :product, class_name: "Product", foreign_key: "product_id"

  enum payment_type: [:money, :card]

  validates :quantity_product, presence: true, numericality: { greater_than: 0, less_than: 100 }
  validates :name_client, presence: true, length: { minimum: 4, maximum: 100 }

  VALID_TEL_FORMAT = /\A\([0-9]{2}\)[0-9]{5}\-[0-9]{4}\z/.freeze
  validates :phone_client, presence: true, length: {maximum: 14 }, format: {with: VALID_TEL_FORMAT}

  validates :street, presence: true, length: { minimum: 5, maximum: 50 }
  validates :number, presence: true, length: { minimum: 1, maximum: 10 }
end
