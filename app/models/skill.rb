class Skill < ApplicationRecord
  # Validation
  validates_presence_of :title, :percent_utilized
end
