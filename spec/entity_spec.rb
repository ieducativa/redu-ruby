require 'spec_helper'

module Redu
  describe Entity do
    let(:links) do
      [
        { "rel" => "self",
          "href" => "http://www.redu.com.br/api/subjects/4723" },
        { "rel" => "lectures",
          "href" => "http://www.redu.com.br/api/subjects/4723/lectures" },
        { "rel" => "space",
          "href" => "http://www.redu.com.br/api/courses/2231" },
        { "rel" => "course",
          "href" => "http://www.redu.com.br/api/courses/exemplo-de-aplicativos" },
      ]
    end
    let(:params) do
      {
        "id" => 12,
        "links" => links,
      }
    end

    subject { Entity.new(params) }

    context "#links" do
      it "should return a LinkCollection" do
        expect(subject.links).to be_a LinkCollection
      end
    end
  end
end
