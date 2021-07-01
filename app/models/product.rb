class Product < ApplicationRecord
    belongs_to :sale

    validates :quantity_product, presence: true, numericality: { greater_than: 0, less_than: 100 }
    validates :name, presence: true, length: { minimum: 4, maximum: 100 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :discount, presence: false, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: :price}
end
