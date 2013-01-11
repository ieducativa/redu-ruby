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

    context "#me" do
      before do
        stub_request(:get, "http://redu.com.br/api/me").
          with(headers => headers).
          to_return(:status => 200, :body => JSON.generate(user_repr),
                    :headers => {'Content-type' => 'application/json'})
      end

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

    context "#users" do
      let(:space) { Space.new(:id => 1, :name => 'Lorem')}
      let(:users_repr) { Array.new(3, user_repr) }
      let(:request_stub) do
        stub_request(:get, "http://redu.com.br/api/spaces/1/users")
      end

      context do
        before do
          request_stub.with(:headers => headers).
            to_return(:status => 200, :body => JSON.generate(users_repr),
                      :headers => {'Content-type' => 'application/json'})
        end

        it "shold make the correct HTTP request" do
          subject.users(:space => space)
          request_stub.should have_been_requested
        end

        it "should return a list of users from a space" do
          subject.users(:space => space).collect(&:id).sort.should ==
            users_repr.collect { |u| User.new(u).id }.to_a.sort
        end
      end

      it "should make the correct HTTP request" do
        request_stub.with(:headers => headers, :query => {'role' => 'member'}).
          to_return(:status => 200, :body => JSON.generate(users_repr),
                    :headers => {'Content-type' => 'application/json'})
        subject.users(:space => space, :role => 'member')
        request_stub.should have_been_requested
      end
    end
  end
end
