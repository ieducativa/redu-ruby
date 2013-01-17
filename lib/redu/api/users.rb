module Redu
  module Api
    module Users
      def me
        response = connection.get('me')
        User.new(response.body)
      end

      def users(opts={})
        response = if space_id = opts.delete(:space_id)
          connection.get("spaces/#{space_id}/users", opts)
        elsif course_id = opts.delete(:course_id)
          connection.get("courses/#{course_id}/users", opts)
        end

        response.body.collect { |u| User.new(u) }
      end
    end
  end
end
