# frozen_string_literal: true

require './app/serializers/visits'

RSpec.describe Serializer::Visits do
  context '#serialize' do
    let(:subject) { Serializer::Visits.new(weblog).serialize }

    let(:page) { '/home/1' }
    let(:weblog) do
      weblog = WebLog.new(page)
      weblog.add('192.168.1.1')
      weblog
    end

    it 'should return information about visits' do
      expect(subject).to eq "#{page} 1 visits"
    end
  end
end
