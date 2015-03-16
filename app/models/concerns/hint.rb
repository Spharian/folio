module Hint
  extend ActiveSupport::Concern

  def generate_hint(image_size)
    ActionController::Base.helpers.image_tag(image.url, width: image_size) unless new_record?
  end
end
