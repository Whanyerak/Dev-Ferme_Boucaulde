class ChangeNbButtersAndNbCheesesType < ActiveRecord::Migration[5.1]
  def change
    change_column :carts, :nb_butters, :integer
    change_column :carts, :nb_cheeses, :integer
  end
end
