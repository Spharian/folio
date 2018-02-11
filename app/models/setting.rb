class Setting < ActiveRecord::Base
  # Paperclip
  has_attached_file :cv
  validates_attachment :cv, presence: true, content_type: { content_type: 'application/pdf' }
end
