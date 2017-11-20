require "test_helper"

class CheeseTest < ActiveSupport::TestCase
  test "removing a cheese properly increase default amount" do
    c = Cheese.create(name: "Ketchup")
    o = Ordering.new(
      user: users(:default),
      distribution_point: distribution_points(:avesnes),
      cart: carts(:big),
      nb_yaourts: 25
    )

    o.cheeses = { c.id => 4, Cheese.default.id => 5 }
    o.save!

    assert_equal 4, o.cheeses[c.id]
    assert_equal 5, o.cheeses[Cheese.default.id]

    c.destroy
    o.reload

    assert_equal 9, o.cheeses[Cheese.default.id]
    assert_nil o.cheeses[c.id]
  end
end
