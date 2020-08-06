class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true,
  length: { maximum: 20 }
  validates :mail_address, presence: true, uniqueness: true,
  length: { maximum: 256 }
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  def self.digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
  BCrypt::Password.create(string, cost: cost)
  end
  def remember
  self.remember_token = User.new_token
  update_attribute(:remember_digest, User.digest(remember_token))
  end
end
