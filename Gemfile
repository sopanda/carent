# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '~> 0.21'
gem 'pry-rails'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'shoulda-matchers', '~> 3.1'
end

# gem 'apitome'
gem 'active_model_serializers'
gem 'figaro'
gem 'geocoder'
gem 'has_scope'
gem 'knock'
gem 'virtus'
gem 'ffaker'
