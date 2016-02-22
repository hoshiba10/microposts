class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    unless current_user == @user
      redirect_to root_url
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :prefecture)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
