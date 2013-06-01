require 'spec_helper'

module Redu
  describe Link do
    let(:link) do
      { "rel" => "space", "href" => "http://www.redu.com.br/api/courses/2231" }
    end
    subject { Link.new(link) }

    it "should return the href" do
      expect(subject.href).to eq link["href"]
    end

    it "should return the relationship" do
      expect(subject.relationship).to eq link["rel"]
    end

    it "should alias #rel to #relationship" do
      expect(subject.rel).to eq subject.relationship
    end

    context "==" do
      it "should return true when the objects have the same rel and href" do
        expect(subject).to eq Link.new(link)
      end

      it "should return false otherwise" do
        expect(subject).to_not eq Link.new({})
      end
    end
  end
end
