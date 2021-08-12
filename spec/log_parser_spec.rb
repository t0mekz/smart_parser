# frozen_string_literal: true

require './app/log_parser'

RSpec.describe LogParser do
  let(:file_path) { './spec/fixtures/test_webserver.log' }
  let(:log_parser) { LogParser.new(file_path) }

  describe '#parse' do
    let(:subject) { log_parser.parse }

    it "should return collection" do
      expect(subject).to be_an Array  
    end

    it "should return collection of weblogs" do
      expect(subject).to all( be_an WebLog )
    end

    it "should return all records from file" do
      expect(subject.count).to eq 3
    end
  end
end
