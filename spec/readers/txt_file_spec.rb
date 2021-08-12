# frozen_string_literal: true

require './app/readers/txt_file'

RSpec.describe Reader::TxtFile do
  describe '#read' do
    let(:file_path) { './spec/fixtures/test_webserver.log' }
    let(:subject) { Reader::TxtFile.new(file_path) }
    it 'should read file' do
      collection = []
      subject.read do |path, ip|
        collection.push([path, ip])
      end
      expect(collection).to include ['/help_page/1', '126.318.035.038']
    end
  end
end
