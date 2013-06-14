require 'spec_helper'

module Redu
  describe Connection do
    let(:connection) { Connection.new(oauth_token: 'foobar') }
    let(:headers) do
      {'Accept'=>'*/*', 'Content-Type'=>'application/json',
       'Authorization' => "OAuth foobar"}
    end

    it "should initialize a connection object" do
      expect(Connection.new).to be_a Connection
    end

    %w(get post put delete).each do |method|
      it "should respond to #{method}" do
        expect(connection).to respond_to method
      end

      context do
        before do
          stub_request(method.to_sym, "http://redu.com.br/api/foo/bar").
            with(headers: headers).to_return(status: 200, body: "",
                                                headers: {})

        end

        it "should issue a #{method.upcase} request when calling ##{method}" do
          connection.send(method, 'foo/bar')
          request = a_request(method.to_sym, "http://redu.com.br/api/foo/bar").
            with(headers: {'Content-type'=>'application/json'})
          expect(request).to have_been_made
        end

        it "should return a Response object when calling ##{method}" do
          expect(connection.send(method, 'foo/bar')).to be_a Faraday::Response
        end
      end
    end

    context "querystring" do
      it "should make the request with the querystring" do
        s = stub_request(:get, "http://redu.com.br/api/foo/bar").
          with(headers: headers, query: { foo: :bar }).
          to_return(status: 200, body: "", headers: {})

        connection.get('foo/bar', foo: :bar)
        expect(s).to have_been_requested
      end
    end

    context "the response" do
      it "should contain a representation of returned JSON" do
        user = { "login" => "guiocavalcanti", "first_name" => "Guilherme",
                 "id" => 12, "last_name" => "Cavalcanti" }

        stub_request(:get, "http://redu.com.br/api/foo/bar").
          with(headers: headers).
          to_return(status: 200, body: JSON.generate(user),
                    headers: { 'Content-Type' => 'application/json' })

        expect(connection.get('foo/bar').body.to_a.sort).to eq user.to_a.sort
      end
    end
  end
end
