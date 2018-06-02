class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.find_each do |user|
      return user.name
    end
  end

  def show
    @hash  = request.env["omniauth.auth"]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :first_name, 
                :last_name, :birth_date, :self_info)
  end
end
