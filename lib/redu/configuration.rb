require 'configurable'

module Redu
  class Configuration
    include Configurable
    config :consumer_key
    config :consumer_secret
    config :oauth_token
    config :oauth_token_secret
  end
end
