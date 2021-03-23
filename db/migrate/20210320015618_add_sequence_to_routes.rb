class AddSequenceToRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :routes, :sequence, :integer
  end
end
