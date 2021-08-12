# frozen_string_literal: true

require './app/log_parser'

RSpec.describe LogParser do
  let(:file_path) { './spec/fixtures/test_webserver.log' }
  let(:log_parser) { LogParser.new(file_path) }

  describe '#most_viewed' do
    let(:subject) { log_parser.most_viewed }

    it 'should calculate proper number of views' do
      expect(subject.select { |el| el.page.eql? '/help_page/1' }.first.views).to eq 3
      expect(subject.select { |el| el.page.eql? '/contact' }.first.views).to eq 2
      expect(subject.select { |el| el.page.eql? '/about/2' }.first.views).to eq 1
    end

    it 'should return result in correct order' do
      expect(subject.map(&:page)).to eq ['/help_page/1', '/contact', '/about/2']
    end
  end

  describe '#most_unique_views' do
    let(:subject) { log_parser.most_unique_views }

    it 'should calculate proper number of views' do
      expect(subject.select { |el| el.page.eql? '/help_page/1' }.first.unique_views).to eq 3
      expect(subject.select { |el| el.page.eql? '/contact' }.first.unique_views).to eq 1
      expect(subject.select { |el| el.page.eql? '/about/2' }.first.unique_views).to eq 1
    end

    it 'should return result in correct order' do
      expect(subject.map(&:page)).to eq ['/help_page/1', '/contact', '/about/2']
    end
  end
end
