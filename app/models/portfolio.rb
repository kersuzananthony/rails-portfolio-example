class Portfolio < ApplicationRecord
  include Placeholder

  # Hooks
  after_initialize :set_defaults

  # Validation
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Scope
  scope :angular, -> { where(subtitle: 'Angular')}
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails')}

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
