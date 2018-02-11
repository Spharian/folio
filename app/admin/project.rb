ActiveAdmin.register Project do
  menu priority: 1

  config.filters = false
  config.sort_order = "position_asc"

  permit_params :title, :description, :text, :category_id, :featured_image, :position,
                        :featured_image_x, :featured_image_y, :featured_image_scale,
                        pictures_attributes: [:id, :project_id, :image, :position, :_destroy],
                        videos_attributes: [:id, :project_id, :video_link, :position, :_destroy],
                        marmoset_viewers_attributes: [:id, :project_id, :iframe_html, :position, :_destroy]

  sortable

  controller do
    def update
      update! do |format|
        format.html { redirect_to :back } unless slug_changed
      end
    end

  private
    def slug_changed
      !scoped_collection.friendly.find_by_slug(params[:id])
    end
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    column :title
    column :category do |object|
      object.category.name
    end
    column :featured_image do |object|
      object.featured_image_file_name
    end

    column "" do |resource|
      links = "".html_safe
      links += link_to I18n.t("active_admin.edit"), edit_resource_path(resource), class: "member_link edit_link"
      links += link_to I18n.t("active_admin.delete"), resource_path(resource), method: :delete, confirm: I18n.t("active_admin.delete_confirmation"), class: "member_link delete_link"
      links
    end

    sortable_handle_column
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :title
      f.input :category, required: true, include_blank: false
      f.input :text, as: :ckeditor, label: false
      f.input :featured_image, as: :file, required: true, hint: f.object.generate_hint(300)
      f.input :featured_image_scale,
        as: :select,
        include_blank: false,
        collection: (1..3).step(0.1).map { |number| number.round(2) }
      f.input :featured_image_x
      f.input :featured_image_y
    end

    f.inputs "Pictures" do
      f.has_many :pictures, heading: false, allow_destroy: true, sortable: :position do |picture|
        picture.input :image, as: :file, required: true, hint: picture.object.generate_hint(150)
      end
    end

    f.inputs "Videos" do
      f.has_many :videos, heading: false, allow_destroy: true, sortable: :position do |video|
        video.input :video_link, label: "Video link"
      end
    end

    f.inputs "Marmoset Viewers" do
      f.has_many :marmoset_viewers, heading: false, allow_destroy: true, sortable: :position do |video|
        video.input :iframe_html, label: "HTML code"
      end
    end

    f.actions
  end
end
