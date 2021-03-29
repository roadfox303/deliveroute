class RouteSpot < ApplicationRecord
  include MultipleUpdate
  belongs_to :route
  belongs_to :spot

  before_validation :set_sequence

  private
    def set_sequence
      if sequence.nil?
        self.sequence = (self.route.route_spots.maximum("sequence") != nil ? self.route.route_spots.maximum("sequence") + 1 : 1)
      end
    end
end
