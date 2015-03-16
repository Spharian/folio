ActiveAdmin.register Category do
  menu priority: 2

  config.filters = false
  config.sort_order = 'position_asc'

  permit_params :name, :position

  actions :all, except: :show

  sortable

  index do
    selectable_column
    column :name
    actions
    sortable_handle_column
  end

  form do |f|
    f.inputs 'Category Details' do
      f.input :name
    end
    f.actions
  end
end
