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

  describe '#output' do
    let(:message) { 'Test message' }
    let(:dummy_output) { instance_double(IO) }

    subject { klass.new.output(message) }

    before do
      allow(Comms).to receive(:output) { dummy_output }
      allow(dummy_output).to receive(:puts)
      subject
    end

    it 'delegates logging to the Logging logger' do
      expect(dummy_output).to have_received(:puts).with(message)
    end
  end
end