require 'spec_helper'

module Redu
  describe Client do
    context ".new" do
      subject { Client.new }
      %w(consumer_key consumer_secret oauth_token oauth_token_secret).each do |c|
        it "should use Redu.config #{c} by default" do
          Redu.config.stub(:"#{c}").and_return("#{c}_value")
          expect(subject.send(:"#{c}")).to eq "#{c}_value"
        end

        it "should override Redu.config if #{c} option is passed" do
          Redu.config.stub(:"#{c}").and_return("#{c}_value")
          expect(Client.new(c.to_sym => "#{c}_value_2").send(:"#{c}")).
            to eq "#{c}_value_2"
        end
      end
    end

    context "#connection" do
      it "should setup connection" do
        expect(subject.connection).to be_a Connection
      end
    end
  end
end
