class ApplicationController < ActionController::API
  attr_accessor :current_user

  private 

    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Не вірний пароль' }, status: 401 unless @current_user
    end

    def entrepreneur 
      render json: { error: 'Ви не являєтесь підприємце! Для того щоб створювати нові курси ви мусите бути підриємцем!' }, status: 500 unless @current_user.entrepreneur
    end
end
