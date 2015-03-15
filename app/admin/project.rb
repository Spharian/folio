ActiveAdmin.register Project do
  menu priority: 1

  # Options
  config.filters = false
  config.sort_order = 'position_asc'

  # Accessible parameters
  permit_params :title, :description, :text, :category, :featured_image, :position,
                        pictures_attributes: [:id, :project_id, :image, :position, :_destroy]

  # Disable show action
  actions :all, except: :show

  # Make the index page resources dragable
  sortable

  # Index view
  index do
    selectable_column
    column :title
    column :description
    column :featured_image do |object|
      object.featured_image_file_name
    end
    actions
    sortable_handle_column
  end

  form do |f|
    f.inputs 'Project Details' do
      f.input :title
      f.input :description
      f.input :text

      # Preview image
      hint = f.image_tag(f.object.featured_image.url, width: 300) unless f.object.new_record? || f.object.featured_image.nil?
      f.input :featured_image, as: :file, hint: hint, required: true
    end

    # Add nested pictures dynamically
    f.inputs 'Pictures' do
      f.has_many :pictures, heading: false, allow_destroy: true, sortable: :position do |picture|
        hint = f.image_tag(picture.object.image.url, width: 150) unless picture.object.new_record? || picture.object.image.nil?
        picture.input :image, as: :file, hint: hint
      end
    end

    f.actions
  end
end
