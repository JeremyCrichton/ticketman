class Comment < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :ticket

  validates :body, presence: true
end
