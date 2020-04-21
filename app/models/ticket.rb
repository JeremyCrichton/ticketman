class Ticket < ApplicationRecord
  enum status:  [:created, :blocked, :in_progress, :fixed]

  belongs_to :project

  validates :name, presence: true
end
