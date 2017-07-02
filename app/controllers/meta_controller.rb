class MetaController < ApplicationController
  before_action :load_resources

  def index
  end

  def update
    current_user.shipment = params.permit(butters: {}, yaourts: {}, cheeses: {}).to_hash

    if current_user.save
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
