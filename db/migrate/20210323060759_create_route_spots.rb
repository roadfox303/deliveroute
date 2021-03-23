class CreateRouteSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :route_spots do |t|
      t.references :route, foreign_key: true
      t.references :spot, foreign_key: true
      t.time :arrival
      t.integer :volume
      t.text :memo
      t.integer :sequence
      t.timestamps
    end
    add_index :route_spots, :sequence
    add_index :route_spots, :arrival
  end
end
