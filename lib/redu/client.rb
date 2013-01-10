module Redu
  class Client
    attr_reader :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret

    def initialize(opts={})
      Redu.config.config.keys.each do |key|
        config = opts[key] || Redu.config.send(:"#{key}")
        instance_variable_set(:"@#{key}", config)
      end
    end

    def connection
      @connection ||= Connection.new
    end
  end
end
