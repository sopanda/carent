# frozen_string_literal: true

require 'spec_helper'
require 'database_cleaner'
require 'factory_bot'
require 'shoulda-matchers'
require 'ffaker'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

ENV['RAILS_ENV'] ||= 'test'
abort('The Rails environment is running in production mode!') if Rails.env.production?

Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configuration do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
