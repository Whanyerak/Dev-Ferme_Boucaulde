module YaourtDecorator
  def value
    current_user.shipment['yaourts'][id.to_s] || 0
  end

  def field_name
    "yaourt[#{id}]"
  end
end
