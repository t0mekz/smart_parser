# frozen_string_literal: true

require './app/serializers/unique_views'

RSpec.describe Serializer::UniqueViews do
  context '#serialize' do
    let(:subject) { Serializer::UniqueViews.new(weblog).serialize }

    let(:page) { '/home/1' }
    let(:weblog) do
      weblog = WebLog.new(page)
      weblog.add('192.168.1.1')
      weblog.refresh_unique_views_counter
      weblog
    end

    it 'should return information about unique visits' do
      expect(subject).to eq "#{page} 1 unique views"
    end
  end
end
