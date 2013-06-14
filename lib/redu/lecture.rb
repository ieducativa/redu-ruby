module Redu
  class Lecture < Entity
    attribute :name, String
    attribute :position, Integer
    attribute :view_count, Integer
    attribute :type, String
    attribute :rating, Integer
    attribute :mimetype, String
    attribute :current_url, String
    attribute :container_type, String
  end
end
