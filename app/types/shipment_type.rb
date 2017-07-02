require 'json'

class ShipmentType < ActiveRecord::Type::Value
  def cast(value)
    if value.kind_of?(String)
      hash = JSON.load(value)
    else
      hash = value
    end

    hash.symbolize_keys!

    [:butters, :yaourts, :cheeses].each do |e|
      hash[e].transform_keys!(&:to_i)
             .transform_values!(&:to_i)
    end

    hash
  end

  def serialize(hash)
    JSON.dump(hash)
  end
end
