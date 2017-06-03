module YaourtDecorator
  def field(shipment)
    tag.tr do
      tag.td(name) +
      tag.td(number_field_tag(field_name, value(shipment), min: 0))
    end
  end

  def value(shipment)
    shipment.yaourts[id.to_s] || 0
  end

  def field_name
    "yaourts[#{id}]"
  end
end
