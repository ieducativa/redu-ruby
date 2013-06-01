module Redu
  class LinkParser
    def initialize(links)
      @raw_links = links
    end

    def parse
      @parsed_links ||= @raw_links.map { |link| Link.new(link) }
    end
  end
end
