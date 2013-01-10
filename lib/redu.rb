require 'rubygems'
require 'bundler/setup'

require 'redu/version'
require 'redu/configuration'

module Redu
  def self.configure(&block)
    yield(config)
  end

  def self.config
    @@configuration ||= Configuration.new
  end
end

require "redu/connection"
