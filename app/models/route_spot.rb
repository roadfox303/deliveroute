class RouteSpot < ApplicationRecord
  include MultipleUpdate
  belongs_to :route
  belongs_to :spot
end
