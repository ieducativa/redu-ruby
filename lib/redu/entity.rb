module Redu
  class Entity
    include Virtus

    attribute :id, Integer
    attribute :links, Array[Link]

    def links
      LinkCollection.new(:items => @links)
    end
  end
end
