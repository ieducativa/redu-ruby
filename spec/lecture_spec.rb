require 'spec_helper'

module Redu
  describe Lecture do
    let(:params) do
      {
        "id"=> 7987,
        "name"=> "teste",
        "position"=> 2,
        "view_count"=> 0,
        "type"=> "Canvas",
        "rating"=> 0,
        "created_at"=> "2013-05-18T15:56:50-03:00",
        "updated_at"=> "2013-05-18T15:56:50-03:00",
        "mimetype"=> "application/x-canvas",
        "current_url"=> "http://autorregulacao.herokuapp.com/questions/117",
        "container_type"=> "Lecture"
      }
    end
    subject { Lecture.new(params) }

    it "should have the attributes" do
      params.slice("created_at", "updated_at").each do |attr, value|
        expect(subject.send(attr)).to eq value
      end
    end
  end
end
