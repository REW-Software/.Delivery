class Address < ApplicationRecord
  belongs_to :user

  VALID_CEP_FORMAT= /\A[0-9]{5}-[0-9]{3}\Z/
  validates :cep, presence: true, length: {maximum: 9}, format: {with: VALID_CEP_FORMAT}

  validates :city, presence: true, length: {maximum: 30}
  validates :district, presence: true, length: {maximum: 20}
  validates :street, presence: true, length: {maximum: 50}
  validates :number, presence: true, length: {maximum: 15}
end
