class CreateOrderings < ActiveRecord::Migration[5.1]
  def change
    create_table :orderings do |t|
      t.references :user, foreign_key: true
      t.references :cart, foreign_key: true
      t.references :distribution_point, foreign_key: true
      t.integer :nb_yaourts
      t.text :butters
      t.text :yaourts
      t.text :cheeses

      t.timestamps
    end
  end
end
