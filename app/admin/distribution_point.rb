ActiveAdmin.register DistributionPoint do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :users
  filter :name

  controller do
    def export
      @distribution_point = DistributionPoint.find(params[:id])

      @cheeses = Cheese.all.to_a
      @yaourts = Yaourt.all.to_a

      filename = @distribution_point.name.underscore + ".xlsx"
      render xlsx: "export", filename: filename
    end
  end
end
