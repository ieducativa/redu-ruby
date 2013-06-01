module Redu
  class LinkParser
    def initialize(links)
      @links = links
    end

    def parse(relationship)
      raw_link = raw_link(relationship)
      Link.new(raw_link)
    end

    private

    def raw_link(relationship)
      @links.select do |link|
        link["rel"] == relationship.to_s
      end.first
    end
  end
end
