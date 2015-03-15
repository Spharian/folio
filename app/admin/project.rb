ActiveAdmin.register Project do
  permit_params :title, :description, :text, :category, :featured_image, pictures_attributes: [:id, :project_id, :image, :position, :_destroy]

  actions :all, except: :show

  index do
    selectable_column
    column :title
    column :description
    column :featured_image do |object|
      object.featured_image_file_name
    end
    actions
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

    # Add pictures dynamically
    f.inputs 'Pictures' do
      f.has_many :pictures, heading: false, allow_destroy: true, sortable: :position do |picture|
        # hint = f.image_tag(picture.object.image.url, width: 300) unless picture.object.new_record? || picture.object.image.nil?
        picture.input :image, as: :file
      end
    end

    f.actions
  end
end
