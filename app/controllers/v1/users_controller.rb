class V1::UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])

    if user.nil?
      render status: 404, json: { error: 'User not found' }.to_json
    else
      render json: user.to_json
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user.to_json
    else
      render status: 500, json: { error: 'User could not be created' }.to_json
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.nil?
      render status: 404, json: { error: 'User not found' }.to_json
    else
      user.destroy
      render json: { message: 'User deleted' }.to_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
