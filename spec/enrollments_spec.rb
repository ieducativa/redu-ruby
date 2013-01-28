require 'spec_helper'

module Redu
  describe 'Api::Enrollments' do
    subject { Client.new }
    let(:enrollment_repr) do
      {
        :role => "member",
        :links => [],
        :state => "approved",
        :id => 1,
      }
    end
    let(:headers) do
      {'Content-Type'=>'application/json'}
    end

    context "#space" do
      let(:request_stub) do
        stub_request(:get, "http://redu.com.br/api/enrollments/1")
      end
      before do
          request_stub.with(headers => headers).
          to_return(:status => 200, :body => JSON.generate(enrollment_repr),
                    :headers => {'Content-type' => 'application/json'})
      end

      it "should return a Enrollment" do
        subject.enrollment(1).should be_a Enrollment
      end

      it "should have the correct attributes" do
        enrollment = subject.enrollment(1)
        enrollment_repr.each do |k,v|
          enrollment.send(:"#{k}").should == v
        end
      end

      it "should generate the correct request" do
        subject.enrollment(1)
        request_stub.should have_been_requested
      end
    end

  end
end
