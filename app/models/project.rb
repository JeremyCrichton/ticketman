class Project < ApplicationRecord
  has_many :tickets

  validates :name, presence: true
  validates :description, presence: true
end
