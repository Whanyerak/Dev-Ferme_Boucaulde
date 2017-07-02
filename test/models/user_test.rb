require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "setting shipment properly transforms keys and values to integers" do
    user = User.new
    user.shipment = {
      'butters' => {'1' => '10'},
      'yaourts' => {'1' => '10'},
      'cheeses' => {'1' => '10'}
    }

    assert_equal 10, user.butters[1]
    assert_equal 10, user.yaourts[1]
    assert_equal 10, user.cheeses[1]
  end

  test "setting shipment properly symbolize top level keys" do
    user = User.new
    user.shipment = {
      'butters' => {},
      'yaourts' => {},
      'cheeses' => {}
    }

    assert_equal({}, user.shipment[:butters])
    assert_equal({}, user.shipment[:yaourts])
    assert_equal({}, user.shipment[:cheeses])
  end

  test "validations" do
    user = users(:default)
    user.shipment = {
      'yaourts' => {"1" => "10", "2" => "30"},
      'cheeses' => {"1" => "4", "2" => "3"},
      'butters' => {"0" => "1", "1" => "1"}
    }

    refute user.valid?

    user.cart = carts(:big)
    user.nb_yaourts = 40

    assert user.valid?
  end
end
