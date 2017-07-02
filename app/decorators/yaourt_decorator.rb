module YaourtDecorator
  def field
    tag.tr do
      tag.td(name) +
      tag.td(field_tag)
    end
  end

  def field_tag
    number_field_tag(field_name, value, min: 0, data: { type: 'yaourt' })
  end

  def value
    current_user.shipment[:yaourts].fetch(id, 0)
  end

  def field_name
    "yaourts[#{id}]"
  end
end
