class Picture < ActiveRecord::Base
  include Hint

  # Associations
  belongs_to :projects

  # Paperclip
  has_attached_file :image
  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage/ }
end
