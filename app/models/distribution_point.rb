class DistributionPoint < ApplicationRecord
  has_many :orderings
  has_many :users, through: :orderings
end
