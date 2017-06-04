ActiveAdmin.register User, as: 'Utilisateur' do
  permit_params :first_name, :last_name, :nb_yaourts, :cart_id,
                :distribution_point_id, :email, :password, :password_confirmation

  index do
    selectable_column
    column :full_name
    column :nb_yaourts
    column :cart
    column :distribution_point
    column :email
    actions
  end

  filter :first_name
  filter :last_name

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :cart
      row :email
      row :admin
      row :distribution_point
      row :nb_yaourts
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :nb_yaourts
      f.input :cart, as: :select, include_blank: false
      f.input :distribution_point, as: :select, include_blank: false
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
