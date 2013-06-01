require 'spec_helper'

describe Redu do
  context ".client" do
    it "should return the client" do
      expect(Redu.client).to be_a Redu::Client
    end

    it "should return the instance previously defined" do
      expect(Redu.client.object_id).to eq Redu.client.object_id
    end
  end

  context "method forwarding" do
    it "should forward method calls to the .client" do
      Redu.client.stub(:me)
      expect(Redu.client).to receive(:me)
      Redu.me
    end
  end
end
