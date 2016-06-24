$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby_code_climate'
require 'pry'
require 'webmock/rspec'
require 'support/webmock/code_climate_mocks'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.before do
    CodeClimateMocks.mock_successful
  end
end
