class Project < ActiveRecord::Base
  # Validation
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :text, presence: true

  # Relations
  has_many :pictures

  # Paperclip
  has_attached_file :featured_image, styles: { medium: '300x300>', thumb: '200x200>' }
  validates_attachment :featured_image, presence: true, content_type: { content_type: /\Aimage/ }
end
