class RenameNbYaourtsToNbCheeses < ActiveRecord::Migration[5.1]
  def change
    rename_column :carts, :nb_yaourts, :nb_cheeses
  end
end
