class Route < ApplicationRecord
  include MultipleUpdate
  belongs_to :user
  has_many :route_spots, dependent: :destroy
  has_many :spots, through: :route_spots


  validates :name, presence: true, length: { maximum: 20 }

  scope :and_spots, -> { eager_load(:spots).order(name: "ASC")}

  # def self.multi_update(routes_params)
  #   routes_params.to_h[:routes].map do |id, attributes|
  #     route = self.find(id)
  #     route.update_attributes!(attributes)
  #   end
  # end
end
