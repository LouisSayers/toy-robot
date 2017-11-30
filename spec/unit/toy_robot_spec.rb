require 'spec_helper'

describe ToyRobot do
  let(:robot) { described_class.new }

  describe '#execute' do
    let(:command) { instance_double(RoboCommand) }
    let(:grid) { double }

    subject { robot.execute(command, grid) }

    before do
      allow(command).to receive(:execute)
      subject
    end

    it 'executes the command' do
      expect(command).to have_received(:execute).with(robot, grid)
    end
  end

end
