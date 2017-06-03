ActiveAdmin.register Cart do
  permit_params :name, :nb_butters, :nb_cheeses

  index do
    selectable_column
    id_column
    column :name
    column :nb_butters
    column :nb_cheeses
    actions
  end
end
