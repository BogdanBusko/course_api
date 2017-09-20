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
      if user&.valid_password?(password)
        user.update_attribute(:auth_token, SecureRandom.urlsafe_base64)
        return user
      end
      errors.add :user_authentication, 'Не вірний пароль!'
      nil
    end
end