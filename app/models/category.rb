class Category < ActiveRecord::Base
  # Default scopes
  default_scope { order('position') }

  # Relations
  has_many :project, dependent: :destroy

  acts_as_list
end
