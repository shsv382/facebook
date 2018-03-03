class UsersController < ApplicationController
  def index
    @users = User.find_each do |user|
      return user.name
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
