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

    context "==" do
      it "should return true when the objects have the same rel and href" do
        subject.should == Link.new(link)
      end

      it "should return false otherwise" do
        subject.should_not == Link.new({})
      end
    end
  end
end
