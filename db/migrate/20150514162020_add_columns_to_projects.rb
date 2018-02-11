class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :featured_image_x, :integer, default: 0
    add_column :projects, :featured_image_y, :integer, default: 0
    add_column :projects, :featured_image_scale, :float, default: 1
  end
end
