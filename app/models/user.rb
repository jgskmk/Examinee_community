class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :studytimes,dependent: :destroy
  has_many :meetings,dependent: :destroy
  has_secure_password
  attr_accessor :remember_token
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
    self.remember_token = User.new_token #User.update_attributeでもいけるかチェック
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
    update_attribute(:remember_digest, nil)
  end
end
