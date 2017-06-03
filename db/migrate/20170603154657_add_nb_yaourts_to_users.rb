class AddNbYaourtsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nb_yaourts, :integer
  end
end
