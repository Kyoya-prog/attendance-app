# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true,
                   length: { maximum: 20 }
  EMAIL_REGULAR_EXPRESSION = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: EMAIL_REGULAR_EXPRESSION },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :attendances
end
