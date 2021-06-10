class User < ApplicationRecord
  validates :name, presence: true
  validates :birth, presence: true
  validates :email, presence: true
  validates :cpf, presence: true
  validates :rg, presence: true
  validates :street, presence: true
  validates :number, presence: true
  validates :tipo, presence: true
end
