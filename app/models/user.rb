# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimum: 4, maximum: 100 }

  validates :password, presence: true, length: {minimum: 6}

  validates_date :birth, before: -> { Date.current }, presence: true

  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i.freeze
  validates :email, presence: true, length: { maximum: 150 }, format: { with: VALID_EMAIL_FORMAT }, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }

  VALID_CPF_FORMAT = /\A[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}\Z/.freeze
  validates :cpf, presence: true, length: { maximum: 14 }, format: { with: VALID_CPF_FORMAT }

  VALID_RG_FORMAT = /\A\d+\Z/.freeze
  validates :rg, presence: true, length: { maximum: 14 }, format: { with: VALID_RG_FORMAT }

  validates :street, presence: true, length: { minimum: 4, maximum: 100 }

  validates :number, presence: true, length: { minimum: 1, maximum: 10 }

  validates :tipo, presence: true
end
