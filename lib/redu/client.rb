require 'redu/api/users'
require 'redu/api/spaces'
require 'redu/api/subjects'
require 'redu/api/enrollments'
require 'redu/api/lectures'

require 'redu/link'
require 'redu/link_parser'
require 'redu/link_collection'
require 'redu/entity'
require 'redu/user'
require 'redu/space'
require 'redu/subject'
require 'redu/course'
require 'redu/enrollment'
require 'redu/lecture'

module Redu
  class Client
    include Api::Users
    include Api::Spaces
    include Api::Subjects
    include Api::Enrollments
    include Api::Lectures

    attr_reader :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret

    def initialize(opts={})
      Redu.config.config.keys.each do |key|
        config = opts[key] || Redu.config.send(:"#{key}")
        instance_variable_set(:"@#{key}", config)
      end
    end

    def connection
      @connection ||= Connection.new(oauth_token: oauth_token_secret)
    end
  end
end
