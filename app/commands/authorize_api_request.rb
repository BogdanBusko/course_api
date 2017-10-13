class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_accessor :headers

  def user
    @user ||= User.find(decoded_auth_token[:auth_token]) if decoded_auth_token
    @user || errors.add(:token, I18n.t('user_auth_errors.invalid_token')) && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_headers)
  end

  def http_auth_headers
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?

    errors.add(:token, I18n.t('user_auth_errors.missing_token'))
    nil
  end
end
