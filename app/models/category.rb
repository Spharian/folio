class Category < ActiveRecord::Base
  # Default scopes
  default_scope { order('position') }

  # Relations
  has_many :projects, dependent: :destroy

  acts_as_list
end
