class Portfolio < ApplicationRecord
  # Relation
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

  # Uploader
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # Validation
  validates_presence_of :title, :body

  # Scope
  scope :angular, -> { where(subtitle: 'Angular')}
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}
  scope :by_position, -> { order('position ASC') }
end
