require 'spec_helper'

module Redu
  describe LinkCollection do
    let(:links) do
      [
        { "rel" => "self", "href" => "http://www.redu.com.br/api/subjects/4723" },
        { "rel" => "lectures", "href" => "http://www.redu.com.br/api/subjects/4723/lectures" },
        { "rel" => "space", "href" => "http://www.redu.com.br/api/courses/2231" },
        { "rel" => "course", "href" => "http://www.redu.com.br/api/courses/exemplo-de-aplicativos" },
      ]
    end

    subject { LinkCollection.new(links) }

    it "should parse the request relationship" do
      subject.parse(:space).href.should == links[2]["href"]
    end

    it "should return nil if the link don't exist" do
      subject.parse(:environment).href.should be_nil
    end

    it "should return a link" do
      subject.parse(:space).should be_a Link
    end

    it "should be a enumerable" do
      subject.should be_a Enumerable
      subject.should respond_to(:each)
    end
  end
end
