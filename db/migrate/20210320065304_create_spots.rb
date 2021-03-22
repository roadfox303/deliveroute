class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :address
      t.string :tel
      t.string :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :spots, :name
    add_index :spots, :address
  end
end
