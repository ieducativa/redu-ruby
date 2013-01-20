require 'spec_helper'

module Redu
  describe 'Api::Spaces' do
    subject { Client.new }
    let(:subject_repr) do
      { "id" => 1, "name" => "Lorem", "id" => 12, "description" => "Lorem" }
    end
    let(:headers) do
      {'Content-Type'=>'application/json'}
    end

    context "#subject" do
      before do
        stub_request(:get, "http://redu.com.br/api/subjects/1").
          with(headers => headers).
          to_return(:status => 200, :body => JSON.generate(subject_repr),
                    :headers => {'Content-type' => 'application/json'})
      end

      it "should return a Subject" do
        subject.subject(1).should be_a Subject
      end

      it "should have the correct attributes" do
        subj = subject.subject(1)
        subject_repr.each do |k,v|
          subj.send(:"#{k}").should == v
        end
      end
    end

    context "#create_subject" do
      before do
        stub_request(:post, "http://redu.com.br/api/spaces/1/subject").
          with(headers => headers).
          to_return(:status => 201, :body => JSON.generate(subject_repr),
                    :headers => {'Content-type' => 'application/json'})
      end

      context "with hash" do
        it "should return a Subject" do
          subject.create_subject(:space_id => 1, :subject => { :name => 'Lorem' }).
            should be_a Subject
        end
      end
    end
  end
end
