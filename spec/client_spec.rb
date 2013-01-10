require 'spec_helper'

module Redu
  describe Client do
    context ".new" do
      subject { Client.new }
      %w(consumer_key consumer_secret oauth_token oauth_token_secret).each do |c|
        it "should use Redu.config #{c} by default" do
          Redu.config.stub(:"#{c}").and_return("#{c}_value")
          subject.send(:"#{c}").should == "#{c}_value"
        end

        it "should override Redu.config if #{c} option is passed" do
          Redu.config.stub(:"#{c}").and_return("#{c}_value")
          Client.new(c.to_sym => "#{c}_value_2").send(:"#{c}").
            should == "#{c}_value_2"
        end
      end
    end

    context "#connection" do
      it "should setup connection" do
        subject.connection.should be_a Connection
      end
    end
  end
end
