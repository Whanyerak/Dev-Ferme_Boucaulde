require "test_helper"

class OrderingTest < ActiveSupport::TestCase
  test "the default yogurt row is set to the maximum number of yogurts by default" do
    ordering = Ordering.new(
      user:               users(:default),
      distribution_point: distribution_points(:avesnes),
      cart:               carts(:big),
      nb_yaourts:         10
    )

    ordering.save

    assert_equal 10, ordering.yaourts[Yaourt.default.id]
  end

  test "validations" do
    ordering = Ordering.new

    ordering.user = users(:default)
    ordering.cart = carts(:big)
    ordering.distribution_point = distribution_points(:avesnes)
    ordering.nb_yaourts = 39

    ordering.yaourts = { 1 => 10, 2 => 30 }
    ordering.cheeses = { 1 => 4,  2 => 3  }
    ordering.butters = { 0 => 1,  1 => 1  }

    refute ordering.valid?

    ordering.nb_yaourts = 40
    assert ordering.valid?
  end

  test "#computed_yaourts with disabled yaourts" do
    nature    = yaourts(:nature)
    chocolate = yaourts(:chocolate)
    vanilla   = yaourts(:vanilla)

    ordering = Ordering.new
    ordering.yaourts = {
      nature.id    => 3,
      chocolate.id => 7,
      vanilla.id   => 5
    }

    final_yaourts = ordering.computed_yaourts

    assert_equal 10, final_yaourts[nature.id]
    assert_equal 5, final_yaourts[vanilla.id]

    assert chocolate.disabled?
    assert_nil final_yaourts[chocolate.id]
  end
end
