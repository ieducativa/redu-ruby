module Redu
  class Enrollment < Entity
    attribute :role, String
    attribute :state, String
    attribute :links, Array
    attribute :updated_at, DateTime
    attribute :created_at, DateTime
  end
end
