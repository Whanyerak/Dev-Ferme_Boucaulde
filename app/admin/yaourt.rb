ActiveAdmin.register Yaourt do
  permit_params :name

  filter :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end
end
