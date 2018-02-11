class Category < ActiveRecord::Base
  # Validations
  validates :name, presence: true

  # Associations
  has_many :projects, dependent: :destroy

  acts_as_list
end
