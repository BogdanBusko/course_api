require 'securerandom'

class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(auth_token: user.auth_token) if user
  end

  private

  attr_accessor :email, :password

  def user
    user ||= User.find_by(email: email)
    return user if user && user.valid_password?(password)

    errors.add :user_authentication, I18n.t('user_auth_errors.wrong_password')
    nil
  end
end
