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

    it "should return the relationship" do
      subject.relationship.should == link["rel"]
    end

    it "should alias #rel to #relationship" do
      subject.rel.should == subject.relationship
    end
  end
end
