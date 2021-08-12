# frozen_string_literal: true

require './app/models/web_log'

RSpec.describe WebLog do
  describe '.new' do
    let(:subject) { WebLog.new('/home/1') }

    it 'should set page' do
      expect(subject.page).to eq '/home/1'
    end
  end

  describe '#add' do
    let(:weblog) { described_class.new('/home/1') }
    let(:ip) { '192.169.1.1' }
    let(:subject) { weblog.add(ip) }

    context 'when ips are empty' do
      before do
        subject
        weblog.refresh_unique_views_counter
      end

      it 'add ip to ips collection' do
        expect(weblog.ips).to include(ip)
      end

      it 'update views counter' do
        expect(weblog.views).to eq 1
      end

      it 'update unique views counter' do
        expect(weblog.unique_views).to eq 1
      end
    end

    context 'when adding unique record' do
      before do
        weblog.add('192.168.1.2')
        subject
        weblog.refresh_unique_views_counter
      end

      it 'add ip to ips collection' do
        expect(weblog.ips).to include(ip)
      end

      it 'update views counter' do
        expect(weblog.views).to eq 2
      end

      it 'update unique views counter' do
        expect(weblog.unique_views).to eq 2
      end
    end

    context 'when adding not unique record' do
      before do
        weblog.add(ip)
        subject
        weblog.refresh_unique_views_counter
      end

      it 'add ip to ips collection' do
        expect(weblog.ips).to include(ip)
      end

      it 'update views counter' do
        expect(weblog.views).to eq 2
      end

      it 'update unique views counter' do
        expect(weblog.unique_views).to eq 1
      end
    end
  end
end
