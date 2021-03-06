class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :studytimes,dependent: :destroy
  has_many :meetings,dependent: :destroy
  has_secure_password
  attr_accessor :remember_token
  validates :name, presence: true,  length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail_address, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  before_save { self.mail_address = mail_address.downcase }
  validates :password, length: { minimum: 6 }
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
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
    update_attribute(:remember_digest, nil)
  end
end
