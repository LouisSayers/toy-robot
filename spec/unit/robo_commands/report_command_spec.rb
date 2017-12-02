require 'spec_helper'

describe ReportCommand do
  let(:command) { described_class.new }
  let(:dummy_out) { instance_double(IO) }

  describe '#execute' do
    let(:position) { instance_double(Position) }
    let(:robot) { instance_double(ToyRobot, position: position) }
    let(:grid) { instance_double(Grid) }

    subject { command.execute(robot, grid) }

    context 'robot does not have a position' do
      let(:position) { nil }

      before do
        allow(command).to receive(:output)
        subject
      end

      it 'does not attempt to output anything' do
        expect(command).not_to have_received(:output)
      end
    end

    context 'robot has a position' do
      before do
        Comms.set_output(dummy_out)
        allow(command).to receive(:output)
        subject
      end

      it 'prints the position of the robot' do
        expect(command).to have_received(:output).with(position)
      end
    end
  end

end
