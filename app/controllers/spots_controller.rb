class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id, only: %i[edit destroy update show]
  def index
    @user = current_user
    @spots = current_user.spots.order(name: "ASC")
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.new(spot_params)
    if @spot.save
      redirect_to spots_path, notice: "「#{@spot.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      redirect_to spots_path(anchor: "id_#{@spot.id}"), notice: "「#{@spot.name}」を編集しました"
    else
      render :new
    end
  end

  def destroy
  end

  # def update_order
  #   spot.multi_update(routes_params, :routes)
  # end

  private
  def spot_params
    params.require(:spot).permit(:id, :name, :address, :tel, :memo
      # customer_ids:[]
    )
  end
  # def spots_params
  #   params.permit(spots: :sequence)
  # end

  def set_id
    @spot = Spot.find(params[:id])
  end

end
