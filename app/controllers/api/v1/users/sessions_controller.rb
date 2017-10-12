class Api::V1::Users::SessionsController < ApplicationController
  def create
    @command = AuthenticateUser.call(params[:email], params[:password])
    if @command.success?
      User.find_by(email: params[:email]).update_attribute(:last_sign_in, DateTime.now)

      render :create, status: :created
    else
      render json: { error: @command.errors }, status: :unauthorized
    end
  end
end
