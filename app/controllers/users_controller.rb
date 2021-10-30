class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create

    if params[:user][:password]
      @user = User.new(user_params)
      if params[:user][:admin] == "1"
        params[:user][:admin] = "true"
      end
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'new_user_path'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def signup

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)

  end

end
