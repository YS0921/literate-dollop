class Note < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {maximum: 1000}
  validates :user_id, presence: true
end
