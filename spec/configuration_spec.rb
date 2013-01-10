require 'spec_helper'

module Redu
  describe Configuration do
    subject { Configuration.new }
    %w(consumer_key consumer_secret oauth_token oauth_token_secret).each do |c|
      it "should set/get #{c}" do
        subject.send(:"#{c}=", 'foo')
        subject.send(:"#{c}").should == 'foo'
      end
    end
  end
end
