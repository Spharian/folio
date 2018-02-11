ActiveAdmin.register Setting do
  menu priority: 4

  config.filters = false

  permit_params :cv

  actions :all, except: :show

  controller do
    def index
      redirect_to edit_admin_setting_path(id: Setting.last.id) if Setting.last.present?
    end
  end

  form do |f|
    f.inputs "Edit CV" do
      f.input :cv, label: "CV", as: :file, required: true
    end
    f.actions
  end
end
