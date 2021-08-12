# frozen_string_literal: true

require './app/models/web_log'
require './app/comparators/desc_views'

RSpec.describe Comparator::DescViews do
  describe '#compare' do
    let(:weblog_with_one_view) do
      weblog = WebLog.new('/home')
      weblog.add('192.168.1.1')
      weblog
    end

    let(:weblog_without_views) { WebLog.new('/home') }

    context 'when first weblog has more views' do
      let(:subject) { described_class.compare(weblog_with_one_view, weblog_without_views) }
      it { expect(subject).to eq -1 }
    end

    context 'when first weblog has less views' do
      let(:subject) { described_class.compare(weblog_without_views, weblog_with_one_view) }
      it { expect(subject).to eq 1 }
    end

    context 'when both weblogs have equal amount of views' do
      let(:subject) { described_class.compare(weblog_with_one_view, weblog_with_one_view) }
      it { expect(subject).to eq 0 }
    end
  end
end
