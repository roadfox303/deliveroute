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
  before_validation :set_sequence
  after_destroy :align_sequence

  private
    def set_sequence
      if sequence.nil?
        self.sequence = (self.user.routes.size >= 1 ? self.user.routes.maximum("sequence") + 1 : 1)
      end
    end
    def align_sequence
      self.user.routes.order(sequence: "ASC", id:"DESC").map.with_index{ |route,index|
        route.sequence = index + 1
        route.save
      }
    end
end
