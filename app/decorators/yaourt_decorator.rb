module YaourtDecorator
  def field(shipment)
    tag.tr do
      tag.td(name) +
      tag.td(field_tag(shipment))
    end
  end

  def field_tag(shipment)
    number_field_tag(field_name, value(shipment), min: 0, data: { type: 'yaourt' })
  end

  def value(shipment)
    shipment.yaourts[id.to_s] || 0
  end

  def field_name
    "yaourts[#{id}]"
  end
end
