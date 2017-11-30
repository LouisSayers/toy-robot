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

  describe '#move_to' do
    let(:xPos) { 0 }
    let(:yPos) { 0 }
    let(:heading) { Heading::NORTH }
    let(:new_position) { Position.for(xPos, yPos, heading) }

    subject { robot.move_to(new_position) }

    before { subject }

    it 'updates the robots position' do
      expect(robot.position).to eq new_position
    end
  end

end
