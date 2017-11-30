require 'spec_helper'

describe ControlCenter do
  let(:grid) { double }
  let(:robot) { ToyRobot.new }

  subject { described_class.new(commands, grid, robot) }

  describe '#engage' do
    let(:robo_command) { instance_double(RoboCommand) }
    let(:commands) { [ robo_command ] }

    subject { super().engage }

    before do
      allow(robo_command).to receive(:execute)
      subject
    end

    it 'calls the robo command' do
      expect(robo_command).to have_received(:execute).with(robot, grid)
    end
  end

end
