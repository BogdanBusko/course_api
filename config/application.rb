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

DatabaseCleaner.strategy = :truncation

#Load  mongoid configuration file
Mongoid.load!('config/mongoid.yml')

Bundler.require(*Rails.groups)

module CourseApi
  class Application < Rails::Application
    config.api_only = true
  end
end
