module Redu
  module Api
    module Subjects
      def subject(id)
        response = connection.get("subjects/#{id}")
        Subject.new(response.body)
      end
    end
  end
end
