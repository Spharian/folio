ActiveAdmin.register Category do
  menu priority: 2

  # Options
  config.filters = false
  config.sort_order = 'position_asc'

  # Accessible parameters
  permit_params :name, :position

  # Disable show action
  actions :all, except: :show

  # Make the index page resources dragable
  sortable

  # Index view
  index do
    selectable_column
    column :name
    actions
    sortable_handle_column
  end

  # Form actions
  form do |f|
    f.inputs 'Category Details' do
      f.input :name
    end
    f.actions
  end
end
