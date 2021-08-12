# frozen_string_literal: true

require './app/repositories/web_log_repository'
require './app/models/web_log'

RSpec.describe WebLogRepository do
  let(:repository) { described_class.new }
  let(:collection) { repository.instance_variable_get(:@collection) }
  describe '.new' do
    it 'should initialize with empty collection' do
      expect(repository.instance_variable_get(:@collection)).to eq({})
    end
  end

  describe '#add' do
    let(:path) { '/hello' }
    let(:ip) { '192.168.1.1' }
    let(:subject) { repository.add(path, ip) }

    context 'when adding first weblog' do
      before { subject }

      it 'should add path to collection' do
        expect(collection).to have_key path
      end

      it 'should add record as WebLog object' do
        expect(collection[path]).to be_instance_of WebLog
      end
    end

    context 'when adding another weblog with the same path' do
      before { subject }

      it 'should have only one weblog in collection' do
        expect(collection.size).to eq 1
      end
    end

    context 'when adding another weblog with different path' do
      let(:different_path) { '/home' }

      before do
        repository.add(different_path, ip)
        subject
      end

      it 'should add path to collection' do
        expect(collection).to have_key different_path
      end

      it 'should have proper amount of weblogs' do
        expect(collection.size).to eq 2
      end
    end
  end
end
