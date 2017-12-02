require 'spec_helper'

describe Grid do
  let(:rows) { 5 }
  let(:cols) { 5 }

  subject { described_class.new(rows, cols) }

  shared_examples 'invalid arguments' do
    let(:expected_message) { 'Grid rows, columns must be > 0' }

    it 'raises argument error' do
      expect { subject }.to raise_error(ArgumentError).with_message(expected_message)
    end
  end

  shared_examples 'valid arguments' do
    it 'does not raise an error' do
      expect { subject }.not_to raise_error
    end
  end

  describe 'rows' do
    context 'less than one' do
      let(:rows) { 0 }
      include_examples 'invalid arguments'
    end

    context 'greater than zero' do
      let(:rows) { 1 }
      include_examples 'valid arguments'
    end
  end

  describe 'cols' do
    context 'less than one' do
      let(:cols) { 0 }
      include_examples 'invalid arguments'
    end

    context 'greater than zero' do
      let(:cols) { 1 }
      include_examples 'valid arguments'
    end
  end

  describe '#position_valid?' do
    let(:xPos) { cols - 1 }
    let(:yPos) { rows - 1 }
    let(:heading) { Heading::NORTH }
    let(:position) { Position.for(xPos, yPos, heading) }

    subject { super().position_valid?(position) }

    context 'valid' do
      it { is_expected.to eq true }
    end

    context 'x >= columns' do
      let(:xPos) { cols }
      it { is_expected.to eq false }
    end

    context 'x < 0' do
      let(:xPos) { -1 }
      it { is_expected.to eq false }
    end

    context 'y >= columns' do
      let(:yPos) { rows }
      it { is_expected.to eq false }
    end

    context 'y < 0' do
      let(:yPos) { -1 }
      it { is_expected.to eq false }
    end
  end

end
