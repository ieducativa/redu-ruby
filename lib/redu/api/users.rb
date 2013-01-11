module Redu
  module Api
    module Users
      def me
        response = connection.get('me')
        User.new(response.body)
      end

      def users(opts={})
        entity = opts.delete(:space)
        qs = opts

        response = connection.get("spaces/#{entity.id}/users", qs)
        response.body.collect { |u| User.new(u) }
      end
    end
  end
end
