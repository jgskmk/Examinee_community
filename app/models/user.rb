class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true,
  length: { maximum: 20 }
  validates :mail_address, presence: true, uniqueness: true,
  length: { maximum: 256 }
end
