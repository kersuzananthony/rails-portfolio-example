class Topic < ApplicationRecord
  has_many :blogs

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validation
  validates_presence_of :title

  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end

end
