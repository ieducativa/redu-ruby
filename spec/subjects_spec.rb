require 'spec_helper'

module Redu
  describe 'Api::Spaces' do
    subject { Client.new }
    let(:subject_repr) do
      { "id" => 1, "title" => "Lorem", "id" => 12, "description" => "Lorem" }
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
  end
end
