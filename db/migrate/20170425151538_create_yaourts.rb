class CreateYaourts < ActiveRecord::Migration[5.1]
  def change
    create_table :yaourts do |t|
      t.string :name

      t.timestamps
    end
  end
end
