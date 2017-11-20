class User < ApplicationRecord
  has_one :ordering, dependent: :destroy
  accepts_nested_attributes_for :ordering

  delegate :cheeses, :butters, :yaourts, :nb_yaourts,
           :cart, :distribution_point, to: :ordering

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
end
