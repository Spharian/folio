ActiveAdmin.register Project do
  permit_params :title, :description, :text, :category, :featured_image

  actions :all, :except => [:show]

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
      
      f.input :featured_image, as: :file, required: true, hint: (image_tag(f.object.featured_image.url(:thumb)) if f.object.featured_image?)
    end
    f.actions
  end
end
