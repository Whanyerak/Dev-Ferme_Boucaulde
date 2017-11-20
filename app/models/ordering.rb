class Ordering < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  belongs_to :distribution_point

  serialize :butters, Hash
  serialize :yaourts, Hash
  serialize :cheeses, Hash

  validate :valid_shipment
  validates_presence_of :nb_yaourts

  before_create do
    yaourts[Yaourt.default.id] = nb_yaourts
  end

  def valid_shipment
    total_butters = butters.values.sum
    total_yaourts = yaourts.values.sum
    total_cheeses = cheeses.values.sum

    if total_yaourts && total_yaourts > nb_yaourts
      errors.add(:yaourts, I18n.t('shipment.errors.too_many_yaourts', {
        nb_yaourts: total_yaourts,
        max_yaourts: user.nb_yaourts
      }))
    else
      errors.delete(:yaourts)
    end

    if total_cheeses > cart.nb_cheeses
      errors.add(:cheeses, I18n.t('shipment.errors.too_many_cheeses', {
        nb_cheeses: total_cheeses,
        max_cheeses: cart.nb_cheeses
      }))
    else
      errors.delete(:cheeses)
    end

    if total_butters > cart.nb_butters
      errors.add(:butters, I18n.t('shipment.errors.too_many_butters', {
        nb_butters: total_butters,
        max_butters: cart.nb_butters
      }))
    else
      errors.delete(:butters)
    end
  end

  # Returns a hash which is a representation of the shipment for the
  # yogurts but with the disabled ones stripped out from the hash and
  # their value added to the default yogurt instead.
  def computed_yaourts
    disabled_ids = Yaourt.disabled.pluck(:id)

    return yaourts unless disabled_ids.present?

    copy       = yaourts.dup
    default    = Yaourt.default.id
    to_nature  = copy.keys & disabled_ids
    nb_natures = 0

    to_nature.each do |id|
      nb_natures += copy.delete(id)
    end

    copy[default] = copy.fetch(default, 0) + nb_natures
    copy
  end
end
