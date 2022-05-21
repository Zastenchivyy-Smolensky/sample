class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to :users_path, alert: "不正なアクセスです"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end