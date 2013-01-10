require 'spec_helper'

module Redu
  describe Connection do
    let(:connection) { Connection.new }
    let(:headers) { {'Accept'=>'*/*', 'Authorization'=>'',
                     'Content-Type'=>'application/json'} }
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
  end
end
