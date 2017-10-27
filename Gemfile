source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'devise'
gem 'email_address'
gem 'jwt'
gem 'kaminari-mongoid'
gem 'mongoid'
gem 'rails-i18n', '~> 5.0.0'
gem 'rails_admin', '~> 1.2'
gem 'simple_command'
gem 'simple_enum', '~> 2.3.0' , require: 'simple_enum/mongoid'
gem 'whenever', require: false

gem 'bcrypt', '~> 3.1.7'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails', '~> 5.1.3'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rubocop'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
