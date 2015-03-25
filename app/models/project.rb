class Project < ActiveRecord::Base
  include Hint
  
  # Aliases 
  alias_attribute :image, :featured_image

  # Default scopes
  default_scope { order('position') }

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  # Associations
  has_many :pictures, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :pictures, allow_destroy: true

  # Paperclip
  has_attached_file :featured_image
  validates_attachment :featured_image, presence: true, content_type: { content_type: /\Aimage/ }

  acts_as_list
end
