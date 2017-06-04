class MetaController < ApplicationController
  before_action :load_resources

  def index
    @shipment = Shipment.new(current_user.shipment)
  end

  def update
    @shipment = Shipment.new(params.permit!.to_hash)

    if @shipment.valid_for?(current_user)
      current_user.shipment = @shipment
      current_user.save

      redirect_to '/', notice: 'Votre commande a été mise à jour avec succès.'
    else
      render :index
    end
  end

  private
    def load_resources
      @yaourts = Yaourt.all
      @cheeses = Cheese.all
    end
end
