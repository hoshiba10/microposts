class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :check_user, only: [:edit, :update]
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)
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
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @following_users = @user.following_users
  end
  
  def followers
    @follower_users = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :prefecture)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
      unless current_user == @user
        redirect_to root_url
      end
  end
end
