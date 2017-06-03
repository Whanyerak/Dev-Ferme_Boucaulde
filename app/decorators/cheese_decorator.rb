module CheeseDecorator
  def field(shipment)
    tag.tr do
      tag.td(name) +
      tag.td(number_field_tag(field_name, value(shipment), min: 0))
    end
  end

  def value(shipment)
    shipment.cheeses[id.to_s] || 0
  end

  def field_name
    "cheeses[#{id}]"
  end
end
