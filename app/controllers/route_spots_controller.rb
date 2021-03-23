class RouteSpotsController < ApplicationController
  def index
    @route = current_user.routes.find(params[:route_id])
    @route_spots = @route.route_spots.eager_load(:spot).order(:sequence)
  end
end
