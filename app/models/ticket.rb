class Ticket < ApplicationRecord
  enum status:  [:created, :blocked, :in_progress, :fixed]

  belongs_to :project
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
end
