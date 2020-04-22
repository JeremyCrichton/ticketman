class Project < ApplicationRecord
  has_many :tickets, foreign_key: :project_id, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true

  def open_tickets
    self.tickets.size - self.closed_tickets
  end

  def closed_tickets
    self.tickets.where('status' => 'fixed').size
  end
end
