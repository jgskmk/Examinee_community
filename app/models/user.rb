class User < ApplicationRecord
  validates :name, presence: true
  validates :mail_address, presence: true

end
