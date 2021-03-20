class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :name, null: false
      t.string :address
      t.integer :tel
      t.string :memo
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :points, :name
    add_index :points, :address
  end
end
