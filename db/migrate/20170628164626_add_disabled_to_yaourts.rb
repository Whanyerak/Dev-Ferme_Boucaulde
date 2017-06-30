class AddDisabledToYaourts < ActiveRecord::Migration[5.1]
  def change
    add_column :yaourts, :disabled, :boolean, default: false
  end
end
