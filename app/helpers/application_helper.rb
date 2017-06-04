module ApplicationHelper
  def butters
    [
      ['Beurre salé', 1],
      ['Beurre demi-sel', 2],
      ['Beurre doux', 3]
    ]
  end

  def butter_check_box(butter, shipment)
    id      = butter.second
    checked = shipment.butters.key?(id.to_s)

    check_box_tag "butters[#{id}]", true, checked, data: { type: 'butter' }
  end
end
