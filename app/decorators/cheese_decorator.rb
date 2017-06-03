module CheeseDecorator
  def value
    current_user.shipment['cheeses'][id.to_s] || 0
  end

  def field_name
    "cheese[#{id}]"
  end
end
