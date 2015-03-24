class Category < ActiveRecord::Base
  # Default scopes
  default_scope { order('position') }

  # Validation
  validates :name, presence: true

  # Associations
  has_many :projects, dependent: :destroy

  acts_as_list
end
