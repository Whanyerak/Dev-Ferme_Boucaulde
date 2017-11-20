ActiveAdmin.register Cheese, as: 'Fromage' do
  permit_params :name

  config.sort_order = 'name_asc'
  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
