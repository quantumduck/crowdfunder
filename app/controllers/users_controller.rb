class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def show
    @projects = Array.new
    Project.all.each do |project|
    if project.user_id == current_user.id
      @projects << project
    end

    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
