require 'spec_helper'

module Redu
  describe Api::Lectures do
    let(:subject_id) { 10 }
    let(:params) do
      {
        lecture: {
          type: 'Canvas',
          name: 'Super duper',
          current_url: 'http://myapp.canvas/1'
        }
      }
    end
    subject { Client.new(oauth_token_secret: 'xyz') }

    context "#create_lecture" do
      let(:headers) do
        { 'Content-Type'=>'application/json', 'Authorization' => 'OAuth xyz' }
      end

      let(:request_stub) do
        url = "http://redu.com.br/api/subjects/#{subject_id}/lectures"
        stub_request(:post, url).
          with(body: params.slice(:subject_id).to_json, headers: headers)
      end

      context "when the request success" do
        before do
          request_stub.to_return(body: params[:lecture].merge(id: 12))
        end

        it "should make an HTTP request with correct param" do
          subject.create_lecture(params.merge(subject_id: subject_id))
          expect(request_stub).to have_been_requested
        end

        it "should return a Lecture entity" do
          result = subject.create_lecture(params.merge(subject_id: subject_id))
          expect(result).to be_a Lecture
        end

        it "should return a valid Lecture" do
          result = subject.create_lecture(params.merge(subject_id: subject_id))
          expect(result.name).to eq params[:lecture][:name]
        end
      end

      context "when the request fails" do
        before do
          request_stub.to_return(status: 500)
        end

        it "should return nil for HTTP status other than 201" do
          request_stub.to_return(status: 500)
          result = subject.create_lecture(params.merge(subject_id: subject_id))
          expect(result).to eq nil
        end
      end
    end
  end
end


