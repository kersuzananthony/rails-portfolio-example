class Skill < ApplicationRecord
  include Placeholder


  # Hook
  after_initialize :set_defaults

  # Validation
  validates_presence_of :title, :percent_utilized

  def set_defaults
    self.badge ||= Placeholder.image_generator(width: 200, height: 200)
  end
end
