# frozen_string_literal: true

require './app/models/web_log'
require './app/comparators/desc_unique_views'

RSpec.describe Comparator::DescUniqueViews do
  describe '#compare' do
    let(:weblog_with_one_view) do
      weblog = WebLog.new('/home')
      weblog.add('192.168.1.1')
      weblog.refresh_unique_views_counter
      weblog
    end

    let(:weblog_without_views) { WebLog.new('/home') }

    context 'when first weblog has more unique views' do
      let(:subject) { described_class.compare(weblog_with_one_view, weblog_without_views) }
      it { expect(subject).to eq -1 }
    end

    context 'when first weblog has less unique views' do
      let(:subject) { described_class.compare(weblog_without_views, weblog_with_one_view) }
      it { expect(subject).to eq 1 }
    end

    context 'when both weblogs have equal amount of unique views' do
      let(:subject) { described_class.compare(weblog_with_one_view, weblog_with_one_view) }
      it { expect(subject).to eq 0 }
    end
  end
end
