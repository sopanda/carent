source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'pry'
gem 'rails', '~> 5.2.1'
gem 'pg', '~> 0.21'
gem 'puma', '~> 3.11'
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec_api_documentation'
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

#gem 'apitome'
gem 'knock'
gem 'figaro'