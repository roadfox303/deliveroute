class Route < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }

  def self.multi_update(routes_params)
    routes_params.to_h[:routes].map do |id, attributes|
      route = self.find(id)
      route.update_attributes!(attributes)
    end
  end
end
