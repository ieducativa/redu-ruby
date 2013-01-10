module Redu
  module Api
    module Spaces
      def space(id)
        response = connection.get("spaces/#{id}")
        Space.new(response.body)
      end
    end
  end
end
