class AddDistributionPointToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :distribution_point, foreign_key: true
  end
end
