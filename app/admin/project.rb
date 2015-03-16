ActiveAdmin.register Project do
  menu priority: 1

  config.filters = false
  config.sort_order = 'position_asc'

  permit_params :title, :description, :text, :category_id, :featured_image, :position,
                        pictures_attributes: [:id, :project_id, :image, :position, :_destroy]

  actions :all, except: :show

  sortable

  index do
    selectable_column
    column :title
    column :description
    column :category do |object|
      object.category.name
    end
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
      f.input :category, include_blank: false
      f.input :text

      # Preview image
      hint = f.image_tag(f.object.featured_image.url, width: 300) unless f.object.new_record?
      f.input :featured_image, as: :file, hint: hint, required: true
    end

    # Add nested pictures dynamically
    f.inputs 'Pictures' do
      f.has_many :pictures, heading: false, allow_destroy: true, sortable: :position do |picture|
        hint = f.image_tag(picture.object.image.url, width: 150) unless picture.object.new_record?
        picture.input :image, as: :file, hint: hint
      end
    end

    f.actions
  end
end
