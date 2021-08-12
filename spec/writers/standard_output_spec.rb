# frozen_string_literal: true
require "./app/writers/standard_output"

RSpec.describe Writer::StandardOutput do
  describe '#write' do
    let(:text) { 'hello' }
    let(:subject) { described_class.new.write(text) }

    it 'should write to standard output' do
      expect { subject }.to output("\"#{text}\"\n").to_stdout
    end
  end
end
