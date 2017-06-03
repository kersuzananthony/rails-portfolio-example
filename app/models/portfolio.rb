class Portfolio < ApplicationRecord
  include Placeholder

  # Relation
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }


  # Hooks
  after_initialize :set_defaults

  # Uploader
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # Validation
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Scope
  scope :angular, -> { where(subtitle: 'Angular')}
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}
  scope :by_position, -> { order('position ASC') }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
