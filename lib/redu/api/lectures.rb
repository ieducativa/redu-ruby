module Redu
 module Api
   module Lectures
     def create_lecture(opts={})
       subject_id = opts.delete(:subject_id)
       response = connection.post("subjects/#{subject_id}/lectures", opts)

       Lecture.new(response.body) if response.success?
     end
   end
 end
end
