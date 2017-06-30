require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  test "validations" do
    shipment = Shipment.new(
      'yaourts' => {"1" => "10", "2" => "30"},
      'cheeses' => {"1" => "4", "2" => "3"},
      'butters' => {"0" => "1", "1" => "1"}
    )

    user = User.new(
      nb_yaourts: 10,
      cart: carts(:tiny)
    )

    refute shipment.valid_for?(user)

    user.cart = carts(:big)
    user.nb_yaourts = 40

    assert shipment.valid_for?(user)
  end
end
