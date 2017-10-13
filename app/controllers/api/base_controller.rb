class Api::BaseController < ApplicationController
  attr_accessor :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: I18n.t('user_auth_errors.wrong_password') }, status: 401 unless @current_user
  end

  def entrepreneur
    render json: { error: I18n.t('user_auth_errors.not_entrepreneur') }, status: 500 unless @current_user.entrepreneur
  end
end
