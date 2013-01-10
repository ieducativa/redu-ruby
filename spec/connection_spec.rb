require 'spec_helper'

module Redu
  describe Connection do
    let(:connection) { Connection.new(:oauth_token => 'foobar') }
    let(:headers) do
      {'Accept'=>'*/*', 'Authorization'=>'',
       'Content-Type'=>'application/json', 'Authorization' => "OAuth foobar"}
    end

    it "should initialize a connection object" do
      Connection.new.should be_a Connection
    end

    %w(get post put delete).each do |method|
      it "should respond to #{method}" do
        connection.should respond_to method
      end

      context do
        before do
          stub_request(method.to_sym, "http://redu.com.br/api/foo/bar").
            with(:headers => headers).to_return(:status => 200, :body => "",
                                                :headers => {})

        end

        it "should issue a #{method.upcase} request when calling ##{method}" do
          connection.send(method, 'foo/bar')
          a_request(method.to_sym, "http://redu.com.br/api/foo/bar").
            with(:headers => {'Content-type'=>'application/json'}).
            should have_been_made
        end

        it "should return a Response object when calling ##{method}" do
          connection.send(method, 'foo/bar').should be_a Faraday::Response
        end
      end
    end

    context "the response" do
      it "should contain a representation of returned JSON" do
        user = { "login" => "guiocavalcanti", "first_name" => "Guilherme",
                 "id" => 12, "last_name" => "Cavalcanti" }

        stub_request(:get, "http://redu.com.br/api/foo/bar").
          with(:headers => headers).
          to_return(:status => 200, :body => JSON.generate(user),
                    :headers => { 'Content-Type' => 'application/json' })

        connection.get('foo/bar').body.to_a.sort.should == user.to_a.sort
      end
    end
  end
end
