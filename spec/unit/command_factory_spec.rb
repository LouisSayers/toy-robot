require 'spec_helper'

describe CommandFactory do

  describe '.create_command' do
    subject { described_class.create_command(command_data) }

    describe 'unknown command' do
      let(:command_data) { { 'command' => :unknown } }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error(ArgumentError, 'Unknown command')
      end
    end

    describe 'place command' do
      let(:command_data) do
        {
          'command' => :place,
          'x' => 1,
          'y' => 3,
          'heading' => 'east'
        }
      end

      it { is_expected.to be_a PlaceCommand }
    end

    describe 'left command' do
      let(:command_data) { { 'command' => :left } }
      it { is_expected.to be_a TurnLeftCommand }
    end

    describe 'right command' do
      let(:command_data) { { 'command' => :right } }
      it { is_expected.to be_a TurnRightCommand }
    end

    describe 'move command' do
      let(:command_data) { { 'command' => :move } }
      it { is_expected.to be_a MoveCommand }
    end

    describe 'report command' do
      let(:command_data) { { 'command' => :report } }
      it { is_expected.to be_a ReportCommand }
    end
  end

end
