class TicketTag < ApplicationRecord
  belongs_to :ticket
  belongs_to :tag

  validates :ticket_id, presence: true
  validates :tag_id, presence: true
end
