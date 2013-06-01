require 'spec_helper'

module Redu
  describe LinkParser do
    let(:links) do
      [
        { "rel" => "self", "href" => "http://www.redu.com.br/api/subjects/4723" },
        { "rel" => "lectures", "href" => "http://www.redu.com.br/api/subjects/4723/lectures" },
        { "rel" => "space", "href" => "http://www.redu.com.br/api/courses/2231" },
        { "rel" => "course", "href" => "http://www.redu.com.br/api/courses/exemplo-de-aplicativos" },
      ]
    end

    subject { LinkParser.new(links) }

    it "should parse the links" do
      expect(subject.parse).to eq links.map { |l| Link.new(l) }
    end

    it "should avoid iterating over the links" do
      subject.parse
      expect(links).to_not receive(:map)
      subject.parse
    end
  end
end
