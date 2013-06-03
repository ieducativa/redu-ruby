module Redu
  class Entity
    include Virtus

    attribute :id, Integer
    attribute :links, Array[Link]
    attribute :created_at, DateTime
    attribute :updated_at, DateTime

    def links
      LinkCollection.new(:items => @links)
    end
  end
end
