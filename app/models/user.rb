class User < ApplicationRecord
  belongs_to :cart

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
