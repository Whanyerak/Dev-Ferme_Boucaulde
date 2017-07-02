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

  test "#yaourts with disabled yaourts" do
    nature    = yaourts(:nature)
    chocolate = yaourts(:chocolate)
    vanilla   = yaourts(:vanilla)

    user = User.new
    user.shipment = {
      'yaourts' => {
        nature.id    => "3",
        chocolate.id => "7",
        vanilla.id   => "5"
      },
      'butters' => {},
      'cheeses' => {}
    }

    yaourts = user.yaourts

    assert_equal 10, yaourts[nature.id]
    assert_equal 5, yaourts[vanilla.id]

    assert chocolate.disabled?
    assert_nil yaourts[chocolate.id]
  end

  test "calling #yaourts doesn't change the shipment" do
    nature    = yaourts(:nature)
    chocolate = yaourts(:chocolate)
    user      = User.new

    user.shipment = {
      'yaourts' => {
        nature.id    => 5,
        chocolate.id => 5
      },
      'butters' => {},
      'cheeses' => {}
    }

    # Strip out the disabled yogurts from a *copy*.
    user.yaourts

    assert_equal 5, user.shipment[:yaourts][nature.id]
    assert_equal 5, user.shipment[:yaourts][chocolate.id]
  end
end
