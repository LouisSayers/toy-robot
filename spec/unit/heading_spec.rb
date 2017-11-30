require 'spec_helper'

describe Heading do
  describe '.for' do
    subject { described_class.for(heading) }

    context 'valid heading' do
      let(:heading) { Heading::NORTH }

      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'invalid heading' do
      let(:heading) { :unknown_heading_type }
      let(:expected_message) { 'Unknown heading value given' }

      it 'raises an error' do
        expect { subject }.to raise_error(ArgumentError).with_message(expected_message)
      end
    end
  end
end
