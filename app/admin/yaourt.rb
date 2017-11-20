ActiveAdmin.register Yaourt do
  permit_params :name, :disabled

  config.sort_order = 'name_asc'
  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :disabled
    actions
  end
end
