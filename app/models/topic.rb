class Topic < ApplicationRecord
  has_many :blogs

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validation
  validates_presence_of :title

end
