class RouteSpotsController < ApplicationController
  require 'time'
  def index
    @route = current_user.routes.find(params[:route_id])
    @route_spots = @route.route_spots.eager_load(:spot).order(:sequence)
  end
  def update_order
    RouteSpot.multi_update(route_spots_params, :route_spots)
    redirect_to route_route_spots_path(params[:route_id])
  end

  private
  def route_spots_params
    params.permit(route_spots: [:sequence, :arrival, :volume, :memo])
  end
end
