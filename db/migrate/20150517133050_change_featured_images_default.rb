class ChangeFeaturedImagesDefault < ActiveRecord::Migration
  def change
    change_column :projects, :featured_image_x, :integer, default: 0, null: false
    change_column :projects, :featured_image_y, :integer, default: 0, null: false
  end
end
