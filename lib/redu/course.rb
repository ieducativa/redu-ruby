module Redu
  class Course < Entity
    attribute :id, Integer
    attribute :name, String
    attribute :description, String
    attribute :workload, String
    attribute :path, String
  end
end
