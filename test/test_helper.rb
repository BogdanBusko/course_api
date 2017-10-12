ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  DatabaseCleaner.clean
  2.times do
    Course.create(
      name: 'Програмування',
      price: 0,
      duration: '2 м.',
      description: 'Test data',
      start_date: DateTime.now + 5,
      information_is_confirmed: true
    )
  end
end
