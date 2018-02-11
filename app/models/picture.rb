class Picture < ActiveRecord::Base
  include Hint

  # Associations
  belongs_to :projects

  # Default scopes
  default_scope { order('position') }

  # Paperclip
  has_attached_file :image,
    # maximum width x maximum height, ratio preserved
    styles: { medium: '950x2500' },
    convert_options: { medium: '-quality 55' }
  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage/ }
end
