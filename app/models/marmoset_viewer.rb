class MarmosetViewer < ActiveRecord::Base
  # Validations
  validates :iframe_html, presence: true

  # Associations
  belongs_to :projects

  # Default scopes
  default_scope { order('position') }
end
