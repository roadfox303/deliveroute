class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id, only: %i[edit destroy update show]

  def index
    @user = current_user
    @routes = current_user.routes.order(sequence: "ASC", id:"DESC")
  end

  def show
  end

  def new
    @route = Route.new
    @route.sequence = Route.maximum("sequence") + 1
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
  end

  def update
    if @route.update(route_params)
      redirect_to routes_path(anchor: "id_#{@route.id}"), notice: "「#{@route.name}」を編集しました"
    else
      render :new
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
    Route.multi_update(routes_params)
  end

  private
  def route_params
    params.require(:route).permit(:id, :name, :memo, :sequence
      # customer_ids:[]
    )
  end
  def routes_params
    params.permit(routes: :sequence)
  end

  def set_id
    @route = Route.find(params[:id])
  end
end
