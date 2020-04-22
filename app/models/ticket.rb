class Ticket < ApplicationRecord
  enum status:  [:created, :blocked, :in_progress, :fixed]

  belongs_to :project
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :assignee, foreign_key: :assignee_id, class_name: 'User'
  
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :project_id, presence: true
end
