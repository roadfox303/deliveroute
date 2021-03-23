class UsersController < ApplicationController
  # before_action :set_id, only: %i[show]
  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end

  private

  # def set_id
  #   @user = User.find(params[:id])
  # end
end
