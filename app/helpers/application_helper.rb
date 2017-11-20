module ApplicationHelper
  Butter = Struct.new(:id, :name)

  def butters
    [
      Butter.new(1, 'Beurre salé'),
      Butter.new(2, 'Beurre demi-sel'),
      Butter.new(3, 'Beurre doux')
    ]
  end

  def commodity_field(item, kind)
    tag.tr do
      tag.td(item.name) +
      tag.td(commodity_field_tag(item, kind))
    end
  end

  def commodity_field_tag(item, kind)
    number_field_tag "#{kind}[#{item.id}]", value(item, kind), min: 0,
      data: { type: kind.to_s.singularize }
  end

  def value(item, kind)
    current_user.send(kind).fetch(item.id, 0)
  end
end
