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

    context 'heading class given instead of symbol' do
      let(:heading) { Heading.for(Heading::NORTH) }

      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end

      it 'gives back the same heading' do
        expect(subject).to eq heading
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

  describe '#to_s' do
    let(:heading_sym) { Heading::NORTH }
    let(:heading) { Heading.for(heading_sym) }

    subject { heading.to_s }

    it 'outputs the string version of the heading sym' do
      expect(subject).to eq heading_sym.to_s.upcase
    end
  end

  describe '#next_clockwise' do
    shared_examples 'next clockwise' do
      it 'retrieves the next heading' do
        given = Heading.for(given_heading)
        expected = Heading.for(next_heading)

        expect(given.next_clockwise).to eq expected
      end
    end

    describe 'NORTH' do
      let(:given_heading) { Heading::NORTH }
      let(:next_heading) { Heading::EAST }
      include_examples 'next clockwise'
    end

    describe 'EAST' do
      let(:given_heading) { Heading::EAST }
      let(:next_heading) { Heading::SOUTH }
      include_examples 'next clockwise'
    end

    describe 'WEST' do
      let(:given_heading) { Heading::WEST }
      let(:next_heading) { Heading::NORTH }
      include_examples 'next clockwise'
    end

    describe 'SOUTH' do
      let(:given_heading) { Heading::SOUTH }
      let(:next_heading) { Heading::WEST }
      include_examples 'next clockwise'
    end
  end

  describe '#next_anticlockwise' do
    shared_examples 'next anticlockwise' do
      it 'retrieves the next heading' do
        given = Heading.for(given_heading)
        expected = Heading.for(next_heading)

        expect(given.next_anticlockwise).to eq expected
      end
    end

    describe 'NORTH' do
      let(:given_heading) { Heading::NORTH }
      let(:next_heading) { Heading::WEST }
      include_examples 'next anticlockwise'
    end

    describe 'WEST' do
      let(:given_heading) { Heading::WEST }
      let(:next_heading) { Heading::SOUTH }
      include_examples 'next anticlockwise'
    end

    describe 'SOUTH' do
      let(:given_heading) { Heading::SOUTH }
      let(:next_heading) { Heading::EAST }
      include_examples 'next anticlockwise'
    end

    describe 'EAST' do
      let(:given_heading) { Heading::EAST }
      let(:next_heading) { Heading::NORTH }
      include_examples 'next anticlockwise'
    end
  end
end
