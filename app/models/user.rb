class User < ApplicationRecord
  has_secure_password

  has_many :created_tickets, foreign_key: :creator_id, class_name: 'Ticket'
	has_many :assigned_tickets, foreign_key: :assignee_id, class_name: 'Ticket'

  validates :name, presence: true
  validates :email, presence: true, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
  validates_uniqueness_of :email, :case_sensitive => false
end
