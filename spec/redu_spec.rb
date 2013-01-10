require 'spec_helper'

describe Redu do
  context ".client" do
    it "should return the client" do
      Redu.client.should be_a Redu::Client
    end

    it "should return the instance previously defined" do
      Redu.client.object_id.should == Redu.client.object_id
    end
  end

  context "method forwarding" do
    it "should forward method calls to the .client" do
      Redu.client.stub(:me)
      Redu.client.should_receive(:me)
      Redu.me
    end
  end
end
