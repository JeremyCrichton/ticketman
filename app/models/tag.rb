class Tag < ApplicationRecord
  has_many :ticket_tags, dependent: :destroy
  has_many :tickets, through: :ticket_tags

  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  validate :name_is_one_word

  def count_tag_by_name(name)
    Tag.where(name: tag.name).size
  end

  def downcase_fields
    self.name.downcase!
  end

  def name_is_one_word
    if self.name.to_s.squish.split.size != 1
      errors.add(:name, 'must be 1 word only.')
    end
  end
end
