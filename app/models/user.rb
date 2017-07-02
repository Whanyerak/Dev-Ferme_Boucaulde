class User < ApplicationRecord
  belongs_to :cart
  belongs_to :distribution_point

  attribute :shipment, :shipment
  validate :valid_shipment

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

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

  def yaourts
    shipment[:yaourts]
  end

  def cheeses
    shipment[:cheeses]
  end
end
