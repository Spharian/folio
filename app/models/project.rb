class Project < ActiveRecord::Base
  # Validation
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true

  # Relations
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  # Paperclip
  has_attached_file :featured_image
  validates_attachment :featured_image, presence: true, content_type: { content_type: /\Aimage/ }
end
