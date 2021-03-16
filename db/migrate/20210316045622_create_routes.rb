class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.string :memo
      t.timestamps
    end
  end
end
