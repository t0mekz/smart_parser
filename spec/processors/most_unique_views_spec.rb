require './app/processors/most_unique_views'

RSpec.describe Processor::MostUniqueViews do
  describe '#process' do
    let(:weblog_with_1_view) { WebLog.new('/home/1', ips: ['192.168.1.1']) }
    let(:weblog_with_2_unique_views) { WebLog.new('/home/2', ips: ['192.168.1.1', '192.168.2.1']) }
    let(:weblog_with_3_not_unique_views) { WebLog.new('/home/3', ips: ['192.168.1.1', '192.168.1.1', '192.168.1.1']) }
    let(:collection) { [weblog_with_1_view, weblog_with_2_unique_views, weblog_with_3_not_unique_views] }
    let(:subject) { described_class.new(collection).process }

    context 'when collection is empty' do
      let(:collection) { [] }
      it 'should return empty collection' do
        expect(subject).to eq []
      end
    end

    it 'should return proper result collection' do
      expect(subject).to eq [weblog_with_2_unique_views, weblog_with_1_view, weblog_with_3_not_unique_views]
    end
  end
end
