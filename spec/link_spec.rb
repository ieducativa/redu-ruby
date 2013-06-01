require 'spec_helper'

module Redu
  describe Link do
    let(:link) do
      { "rel" => "space", "href" => "http://www.redu.com.br/api/courses/2231" }
    end
    subject { Link.new(link) }

    it "should return the href" do
      subject.href.should == link["href"]
    end
  end
end
