class Note < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {in: 1..1000}
  validates :user_id, presence: true
end
