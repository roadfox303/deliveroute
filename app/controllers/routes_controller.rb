class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id, only: %i[edit destroy update show]
  before_action :set_spots, only: %i[new edit]

  def index
    @user = current_user
    @routes = current_user.routes.order(sequence: "ASC", id:"DESC")
  end

  def show
  end

  def new
    @route = Route.new
    # @route.sequence = (current_user.routes != nil ? current_user.routes.maximum("sequence") + 1 : 1)
  end

  def create
    @route = current_user.routes.new(route_params)
    if @route.save
      redirect_to routes_path, notice: "「#{@route.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @have_spots = @route.spots.ids
  end

  def update
    if @route.update(route_params)
      redirect_to routes_path(anchor: "id_#{@route.id}"), notice: "「#{@route.name}」を編集しました"
    else
      render :edit
    end
  end

  def destroy
    if
      @route.destroy
      redirect_to routes_path, notice: "「#{@route.name}」を削除しました"
    else
      render routes_path, alert: "「#{@route.name}」を削除する権限がありません"
    end
  end

  def update_order
    Route.multi_update(routes_params, :routes)
  end

  private
  def route_params
    params.require(:route).permit(:id, :name, :memo, :sequence, spot_ids:[])
  end
  def routes_params
    params.permit(routes: :sequence)
  end

  def set_id
    @route = Route.find(params[:id])
  end

  def set_spots
    @my_spots = current_user.spots
  end
end
