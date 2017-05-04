class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      current_user = @user
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def show
    unless current_user && current_user.id == params[:id].to_i
      redirect_to :root, :error => 'Cannot view other users!'
    end
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
