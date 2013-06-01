module Redu
  class LinkParser
    include Enumerable

    def initialize(links)
      @raw_links = links
    end

    def parse(relationship)
      raw_link = raw_link(relationship)
      Link.new(raw_link)
    end

    def each(&block)
      links.each(&block)
    end

    private

    def items
      @links ||= @raw_links.map { |raw_link| Link.new(raw_link) }
    end

    def raw_link(relationship)
      @raw_links.select do |link|
        link["rel"] == relationship.to_s
      end.first
    end
  end
end
