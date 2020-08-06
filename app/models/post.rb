class Post < ApplicationRecord
  validates :content, presence: true,length: { maximum: 256 }
end
