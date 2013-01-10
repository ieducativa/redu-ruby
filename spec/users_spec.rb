require 'spec_helper'

module Redu
  describe 'Api::Users' do
    subject { Client.new }
    let(:user_repr) do
      { "login" => "guiocavalcanti", "first_name" => "Guilherme", "id" => 12,
        "last_name" => "Cavalcanti" }
    end
    let(:headers) do
      {'Content-Type'=>'application/json'}
    end

    before do
      stub_request(:get, "http://redu.com.br/me").
        with(headers: headers).
        to_return(:status => 200, :body => JSON.generate(user_repr),
                  :headers => {'Content-type' => 'application/json'})
    end

    context "#me" do
      it "should return a User" do
        subject.me.should be_a User
      end

      it "should have the correct attributes" do
        user = subject.me
        user_repr.each do |k,v|
          user.send(:"#{k}").should == v
        end
      end
    end
  end
end
