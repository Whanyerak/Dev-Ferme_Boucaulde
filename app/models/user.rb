class User < ApplicationRecord
  belongs_to :cart
  belongs_to :distribution_point

  attribute :shipment, :shipment
  validate :valid_shipment

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create do
    self.shipment[:yaourts][Yaourt.default.id] = self.nb_yaourts
  end

  def admin?
    admin == true
  end

  def full_name
    first_name + " " + last_name.upcase
  end

  def valid_shipment
    total_butters = butters.values.sum
    total_yaourts = yaourts.values.sum
    total_cheeses = cheeses.values.sum

    if total_yaourts > nb_yaourts
      errors.add(:shipment, I18n.t('shipment.errors.too_many_yaourts', {
        nb_yaourts: total_yaourts,
        max_yaourts: nb_yaourts
      }))
    end

    if total_cheeses > cart.nb_cheeses
      errors.add(:shipment, I18n.t('shipment.errors.too_many_cheeses', {
        nb_cheeses: total_cheeses,
        max_cheeses: cart.nb_cheeses
      }))
    end

    if total_butters > cart.nb_butters
      errors.add(:shipment, I18n.t('shipment.errors.too_many_butters', {
        nb_butters: total_butters,
        max_butters: cart.nb_butters
      }))
    end
  end

  def butters
    shipment[:butters]
  end

  # Returns a hash which is a representation of the shipment for the
  # yogurts but with the disabled ones stripped out from the hash and
  # their value added to the default yogurt instead.
  def yaourts
    disabled_ids = Yaourt.disabled.pluck(:id)

    return shipment[:yaourts] unless disabled_ids.present?

    copy       = shipment[:yaourts].dup
    default    = Yaourt.default.id
    to_nature  = copy.keys & disabled_ids
    nb_natures = 0

    to_nature.each do |id|
      nb_natures += copy.delete(id)
    end

    copy[default] = copy.fetch(default, 0) + nb_natures
    copy
  end

  def cheeses
    shipment[:cheeses]
  end
end
