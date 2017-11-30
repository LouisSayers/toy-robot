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
      allow(robot).to receive(:execute)
      subject
    end

    it 'delegates command execution to robot' do
      expect(robot).to have_received(:execute).with(robo_command, grid)
    end
  end

end
