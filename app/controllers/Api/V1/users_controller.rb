class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: {
      id: user.id,
      username: user.username,
      jwt: JWT.encode({id: user.id}, "taskLister")
    }
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    # byebug
    user = User.find_by(id: params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    # byebug
    user = User.find_by(id: params[:id])
    user.destroy
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
