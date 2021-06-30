class Sale < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :post

  enum payment_type: [:money, :card]

  validates :name_client, presence: true, length: { minimum: 4, maximum: 100 }

  VALID_TEL_FORMAT = /\A\([0-9]{2}\)[0-9]{5}\-[0-9]{4}\z/.freeze
  validates :phone_client, presence: true, length: {maximum: 14 }, format: {with: VALID_TEL_FORMAT}

  validates :street, presence: true, length: { minimum: 5, maximum: 50 }
  validates :number, presence: true, length: { minimum: 1, maximum: 10 }
end
