module Redu
  module Api
    module Subjects
      def subject(id)
        response = connection.get("subjects/#{id}")
        Subject.new(response.body)
      end

      def create_subject(opts={})
        space_id = opts.delete(:space_id)
        response = connection.post("spaces/#{space_id}/subjects", opts.to_hash)
        Subject.new(response.body)
      end
    end
  end
end
