ActiveAdmin.register Yaourt do
  permit_params :name, :disabled

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :disabled
    actions
  end
end
