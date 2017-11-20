ActiveAdmin.register User, as: 'Utilisateur' do
  permit_params :first_name, :last_name, :email,
                :password, :password_confirmation, ordering_attributes: {}

  index do
    selectable_column
    column :first_name
    column :last_name do |u| u.last_name.upcase end
    column :cart
    column :distribution_point
    actions
  end

  filter :first_name
  filter :last_name
  filter :distribution_point

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
    f.inputs "Informations" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.inputs name: "Commande", for: :ordering_attributes do
      f.fields_for :ordering_attributes do |ff|
        ff.input :nb_yaourts
        ff.input :cart_id, as: :select,
          collection: Cart.pluck(:name, :id), include_blank: false
        ff.input :distribution_point_id, as: :select,
          collection: DistributionPoint.pluck(:name, :id), include_blank: false
      end
    end

    f.actions
  end
end
