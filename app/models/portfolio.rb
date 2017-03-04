class Portfolio < ApplicationRecord

  # Hooks
  after_initialize :set_defaults

  # Validation
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Scope
  scope :angular, -> { where(subtitle: 'Angular')}
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}

  def set_defaults
    self.main_image ||= 'http://placehold.it/600x400'
    self.thumb_image ||= 'http://placehold.it/350x200'
  end
end
