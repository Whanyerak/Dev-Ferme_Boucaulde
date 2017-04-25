class MetaController < ApplicationController
  def index
    @carts   = Cart.all
    @yaourts = Yaourt.all
    @cheeses = Cheese.all
  end
end
