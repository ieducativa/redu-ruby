module Redu
  module Api
    module Enrollments
      def enrollment(id)
        response = connection.get("enrollments/#{id}")
        Enrollment.new(response.body)
      end
    end
  end
end
