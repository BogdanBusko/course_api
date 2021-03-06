require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'mongoid'
require 'database_cleaner'
require 'email_address'

DatabaseCleaner.strategy = :truncation

# Load  mongoid configuration file
Mongoid.load!('config/mongoid.yml')

Bundler.require(*Rails.groups)

class Application < Rails::Application
  config.load_defaults 5.1
  config.api_only = true
  config.autoload_paths << Rails.root.join('lib')
  config.i18n.default_locale = :en

  config.session_store :cookie_store
  config.middleware.use ActionDispatch::Cookies
  config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
  config.middleware.use Rack::MethodOverride
end
