require 'spec_helper'

describe Comms do
  let(:klass) do
    Class.new do
      include Comms
    end
  end

  describe '.output' do
    let(:output1) { Comms.output }
    let(:output2) { Comms.output }

    it 'uses STDOUT as the default output mechanism' do
      expect(Comms.output).to eq STDOUT
    end

    it 'uses the same output instance' do
      expect(output1).to eq output2
    end
  end

  describe '.set_output' do
    let(:dummy_output) { instance_double(IO) }

    context 'output has not been called before' do
      before do
        described_class.set_output(dummy_output)
      end

      it 'sets the output' do
        expect(described_class.output).to eq dummy_output
      end
    end

    context 'output has been called before' do
      before do
        described_class.output
        described_class.set_output(dummy_output)
      end

      it 'sets the output' do
        expect(described_class.output).to eq dummy_output
      end
    end
  end

  describe '.set_input' do
    let(:dummy_input) { instance_double(IO) }

    context 'input has not been called before' do
      before do
        described_class.set_input(dummy_input)
      end

      it 'sets the input' do
        expect(described_class.input).to eq dummy_input
      end
    end

    context 'input has been called before' do
      before do
        described_class.input
        described_class.set_input(dummy_input)
      end

      it 'sets the input' do
        expect(described_class.input).to eq dummy_input
      end
    end
  end

  describe '#output' do
    let(:message) { 'Test message' }
    let(:dummy_output) { instance_double(IO) }

    subject { klass.new.output(message) }

    before do
      allow(Comms).to receive(:output) { dummy_output }
      allow(dummy_output).to receive(:puts)
      subject
    end

    it 'delegates output' do
      expect(dummy_output).to have_received(:puts).with(message)
    end
  end

  describe '#input' do
    let(:message) { 'Test message' }
    let(:dummy_input) { instance_double(IO) }
    let(:inputted_text) { "Hello World\n" }

    subject { klass.new.get_input }

    before do
      allow(Comms).to receive(:input) { dummy_input }
      allow(dummy_input).to receive(:gets) { inputted_text }
    end

    it { is_expected.to eq inputted_text.chomp }
  end
end
