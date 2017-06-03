ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation

  index do
    selectable_column
    column :full_name
    column :email
    actions
  end

  filter :first_name
  filter :last_name

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
