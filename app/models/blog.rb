class Blog < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy

  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Validation
  validates_presence_of :title, :body, :topic_id

  # Custom scope
  scope :most_recent, (-> { order(created_at: :desc) })
end
