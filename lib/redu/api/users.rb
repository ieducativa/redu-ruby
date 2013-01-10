module Redu
  module Api
    module Users
      def me
        response = connection.get('/me')
        User.new(response.body)
      end
    end
  end
end
