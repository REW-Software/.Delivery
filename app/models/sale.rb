class Sale < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :post

  enum payment_type: [:money, :card]

  validates :name_client, presence: true, length: { minimum: 4, maximum: 100 }
end
