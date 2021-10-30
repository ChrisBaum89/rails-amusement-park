class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    if session[:id]
      redirect_to user_path(@user)
    elsif params[:user_name] != nil && params[:password]
      if @user = User.find_by(name: params[:user_name])
        return head(:forbidden) unless @user.authenticate(params[:password])
      else
        @user = User.create
      end
      session[:user_id] = @user.id
      session[:name] = @user.name
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
