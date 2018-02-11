class Video < ActiveRecord::Base
  # Validations
  validates :video_link, presence: true

  # Associations
  belongs_to :projects

  # Default scopes
  default_scope { order('position') }
end
