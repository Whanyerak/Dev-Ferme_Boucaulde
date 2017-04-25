ActiveAdmin.register Cart do
  permit_params :name, :nb_butters, :nb_yaourts

  index do
    selectable_column
    id_column
    column :name
    column :nb_butters
    column :nb_yaourts
    actions
  end
end
