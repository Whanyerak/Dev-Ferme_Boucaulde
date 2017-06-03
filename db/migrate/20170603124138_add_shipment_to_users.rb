class AddShipmentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :shipment, :json, default: {
      butters: {},
      cheeses: {},
      yaourts: {}
    }
  end
end
