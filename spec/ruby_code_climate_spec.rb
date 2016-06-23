require 'spec_helper'

describe RubyCodeClimate do
  it 'has a version number' do
    expect(RubyCodeClimate::VERSION).not_to be nil
  end

  describe 'configuration' do
    specify 'it can be configured' do
      RubyCodeClimate.configure do |config|
        config.api_token = 'api_token'
      end

      expect(RubyCodeClimate.configuration.api_token).to_not be_nil
    end
  end
end
