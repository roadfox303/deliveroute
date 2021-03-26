class RouteSpot < ApplicationRecord
  include MultipleUpdate
  belongs_to :route
  belongs_to :spot

  before_validation :set_sequence
  after_destroy :align_sequence

  private
    def set_sequence
      if sequence.nil?
        self.sequence = (self.route.route_spots.size >= 1 ? self.route.route_spots.maximum("sequence") + 1 : 1)
      end
    end
    def align_sequence
      binding.pry
      self.route.route_spots.order(sequence: "ASC", id:"DESC").map.with_index{ |route_spots,index|
        route_spots.sequence = index + 1
        route_spots.save
      }
    end
end
