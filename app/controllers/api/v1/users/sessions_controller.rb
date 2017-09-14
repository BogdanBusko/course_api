class Api::V1::Users::SessionsController < ApplicationController
  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    
    if command.success? 
      render json: { data: 
        {
          token: command.result 
        }
      }, status: :created
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
