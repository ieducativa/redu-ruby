require 'spec_helper'

module Redu
  describe 'Api::Spaces' do
    subject { Client.new }
    let(:space_repr) do
      parse_json(File.open("spec/fixtures/space.json"))
    end
    let(:headers) do
      {'Content-Type'=>'application/json'}
    end

    before do
      stub_request(:get, "http://redu.com.br/api/spaces/1").
        with(headers => headers).
        to_return(:status => 200, :body => JSON.generate(space_repr),
                  :headers => {'Content-type' => 'application/json'})
    end

    context "#space" do
      it "should return a Space" do
        expect(subject.space(1)).to be_a Space
      end

      it "should have the correct attributes" do
        space = subject.space(1)
        space_repr.except(:created_at, :updated_at).each do |k,v|
          expect(space.send(:"#{k}")).to eq v
        end
      end
    end

  end
end
