class Api::V1::UsersController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      head(:accepted)
    else
      head(:unprocesabble_entity)
    end
  end

  private 

  def user_params
    params.permit(:full_name, :email, :password)
  end
end
