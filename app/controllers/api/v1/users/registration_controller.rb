class Api::V1::Users::RegistrationController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      ActivationMailer.activation(user).deliver

      head(:created)
    else
      render json: { error: user.errors.full_messages }, status: 500
    end
  end

  private

  def user_params
    params.permit %i[name email password entrepreneur work_plays facebook phone]
  end
end
