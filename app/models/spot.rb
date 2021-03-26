class Spot < ApplicationRecord
  # include MultipleUpdate

  belongs_to :user
  has_many :route_spots, dependent: :destroy
  has_many :routes, through: :route_spots

  validates :name, presence: true, length: { maximum: 20 }
  validates :address, presence: true
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }

  scope :and_routes, -> { eager_load(:routes).order(sequence: "ASC")}
end
