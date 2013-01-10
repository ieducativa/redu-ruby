require 'rubygems'
require 'bundler/setup'

require 'redu/version'
require 'redu/configuration'
require 'redu/connection'
require 'redu/client'

module Redu
  class << self
    def configure(&block)
      yield(config)
    end

    def config
      @configuration ||= Configuration.new
    end

    def client
      unless defined?(@client)
        @client = Redu::Client.new
      end
      @client
    end

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end if RUBY_VERSION >= "1.9"

    def respond_to?(method_name, include_private=false)
      client.respond_to?(method_name, include_private) || super
    end if RUBY_VERSION < "1.9"

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
