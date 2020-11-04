class UsersController < ApplicationController
  def index
    @users = User.paginate(page: 1)
  end

  def show
    @user = User.find(params[:id])
    @event = @user.events
    @trainings = @user.trainings.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.notice = "アカウントを削除しました。"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
