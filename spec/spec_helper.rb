# frozen_string_literal: true

require 'rails_helper'
require 'rspec-rails'
require 'rspec_api_documentation'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RspecApiDocumentation.configure do |config|
  config.format = :json
  config.docs_dir = Rails.root.join('doc', 'api')
end
