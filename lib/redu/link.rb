module Redu
  class Link
    def initialize(raw_link)
      @link = raw_link || {}
    end

    def href
      @link["href"]
    end

    def relationship
      @link["rel"]
    end
    alias_method :rel, :relationship
  end
end
