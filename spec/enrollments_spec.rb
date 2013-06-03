require 'spec_helper'

module Redu
  describe 'Api::Enrollments' do
    subject { Client.new }
    let(:enrollment_repr) do
      parse_json(File.open("spec/fixtures/enrollment.json"))
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
        expect(subject.enrollment(1)).to be_a Enrollment
      end

      it "should have the correct attributes" do
        enrollment = subject.enrollment(1)
        enrollment_repr.except(:created_at, :updated_at).each do |k,v|
          expect(enrollment.send(:"#{k}")).to eq v
        end
      end

      it "should generate the correct request" do
        subject.enrollment(1)
        expect(request_stub).to have_been_requested
      end
    end

  end
end
