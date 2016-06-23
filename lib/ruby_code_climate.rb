require "ruby_code_climate/version"
require 'excon'
require 'hashie'
require 'json'

require 'code_climate'
require 'repo'

module RubyCodeClimate

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_token

    def initialize
      @api_token = ''
    end
  end
end
