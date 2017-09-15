class Api::V1::Users::ProfileController < ApplicationController
  before_action :authenticate_request

  def show
    render 'api/v1/users/show'
  end

  def edit
    if current_user.update(user_params)
      head(:accepted)
    else
      render json: { error: current_user.errors.full_messages }
    end 
  end

  private 

    def user_params
      params.permit(:full_name, :email, :password, :work_plays, :facebook, :phone)      
    end
end
