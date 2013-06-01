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
        expect(subject.me).to be_a User
      end

      it "should have the correct attributes" do
        user = subject.me
        user_repr.each do |k,v|
          expect(user.send(:"#{k}")).to eq v
        end
      end
    end

    context "#users" do
      let(:space) { Space.new(:id => 1, :name => 'Lorem')}
      let(:course) { Course.new(:id => 1, :name => 'Lorem')}
      let(:users_repr) { Array.new(3, user_repr) }

      context "space_id" do
        let(:request_stub) do
          stub_request(:get, "http://redu.com.br/api/spaces/1/users")
        end
        before do
          request_stub.with(:headers => headers).
            to_return(:status => 200, :body => JSON.generate(users_repr),
                      :headers => {'Content-type' => 'application/json'})
        end

        it "shold make the correct HTTP request" do
          subject.users(:space_id => space.id)
          expect(request_stub).to have_been_requested
        end

        it "should return a list of users from a space" do
          ids = subject.users(:space_id => space.id).collect(&:id).sort
          expect(ids).to eq users_repr.collect { |u| User.new(u).id }.to_a.sort
        end

        it "should make the correct HTTP request when filtering" do
          request_stub.with(:headers => headers, :query => {'role' => 'member'}).
            to_return(:status => 200, :body => JSON.generate(users_repr),
                      :headers => {'Content-type' => 'application/json'})
            subject.users(:space_id => space.id, :role => 'member')
            expect(request_stub).to have_been_requested
        end
      end

      context "course_id" do
        let(:request_stub) do
          stub_request(:get, "http://redu.com.br/api/courses/1/users")
        end
        before do
          request_stub.with(:headers => headers).
            to_return(:status => 200, :body => JSON.generate(users_repr),
                      :headers => {'Content-type' => 'application/json'})
        end

        it "should return a list of users from a course" do
          ids = subject.users(:course_id => course.id).collect(&:id).sort
          expect(ids).to eq users_repr.collect { |u| User.new(u).id }.to_a.sort
        end

        it "shold make the correct HTTP request" do
          subject.users(:course_id => course.id)
          expect(request_stub).to have_been_requested
        end

      end
    end
  end
end
