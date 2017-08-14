source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise'
gem 'haml-rails'
gem 'mongoid'
gem 'rails', '~> 5.0.4'
gem 'puma', '~> 3.0'
gem 'jbuilder', '~> 2.5'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
