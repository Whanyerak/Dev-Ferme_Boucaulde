class MetaController < ApplicationController
  before_action :load_resources

  def index
  end

  def update
    if current_user.ordering.update(ordering_params)
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

    def ordering_params
      params.require(:ordering)
            .permit(butters: {}, yaourts: {}, cheeses: {})
            .transform_values do |h|
              h.transform_keys(&:to_i).transform_values(&:to_i)
            end
    end
end
