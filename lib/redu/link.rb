module Redu
  class Link
    def initialize(raw_link)
      @link = raw_link || {}
    end

    def href
      @link["href"]
    end
  end
end
