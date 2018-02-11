class Project < ActiveRecord::Base
  extend FriendlyId
  include Hint
  friendly_id :title, use: :slugged

  # Aliases
  alias_attribute :image, :featured_image

  # Default scopes
  default_scope { order('position DESC') }

  # Validations
  validates :title, presence: true
  validates :category_id, presence: true

  # Associations
  has_many :pictures, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :marmoset_viewers, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :marmoset_viewers, allow_destroy: true

  # Paperclip
  has_attached_file :featured_image,
    # maximum width x maximum height, ratio preserved
    styles: { medium: '950x1400' },
    convert_options: { medium: '-quality 55' }
  validates_attachment :featured_image, presence: true, content_type: { content_type: /\Aimage/ }

  acts_as_list

  before_save do
    self.featured_image_x ||= 0
    self.featured_image_y ||= 0
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def prev
    previous_projects(position).last.friendly_id if previous_projects(position).exists?
  end

  def next
    next_projects(position).first.friendly_id if next_projects(position).exists?
  end

private
  def previous_projects(position)
    self.class.where('position > ?', position)
  end

  def next_projects(position)
    self.class.where('position < ?', position)
  end
end
