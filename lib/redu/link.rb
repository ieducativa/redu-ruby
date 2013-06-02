module Redu
  class Link
    include Virtus

    attribute :href, String
    attribute :rel, String

    alias_method :relationship, :rel

    def ==(other)
      self.href == other.href && self.rel == other.rel
    end
  end
end
