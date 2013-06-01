module Redu
  class LinkCollection
    include Enumerable

    def initialize(options={})
      @raw_links = options[:items]
      @parser_class = options[:parser] || LinkParser
    end

    def fetch(relationship)
      find { |i| i.rel == relationship.to_s }
    end

    def each(&block)
      items.each(&block)
    end

    private

    def parser_builder
      @parser ||= @parser_class.new(@raw_links)
    end

    def items
      @items ||= parser_builder.parse
    end
  end
end
