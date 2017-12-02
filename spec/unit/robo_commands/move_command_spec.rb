require 'spec_helper'

describe MoveCommand do
  describe 'execute' do
    let(:command) { described_class.new }
    let(:heading) { Heading::NORTH }
    let(:position) { Position.for(1, 1, heading) }
    let(:robot) { instance_double(ToyRobot, position: position) }
    let(:grid) { instance_double(Grid) }
    let(:grid_position_valid) { true }

    subject { command.execute(robot, grid) }

    before do
      allow(grid).to receive(:position_valid?) { grid_position_valid }
      allow(robot).to receive(:move_to)
    end

    shared_examples 'moves correctly' do
      it 'moves the robot' do
        subject
        expect(robot).to have_received(:move_to).with(final_position)
      end
    end

    describe 'position does not exist' do
      let(:position) { nil }

      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end

      it 'does not move the robot' do
        subject
        expect(robot).not_to have_received(:move_to)
      end
    end

    describe 'moving off the grid' do
      let(:grid_position_valid) { false }

      before { subject }

      it 'does not move the robot' do
        expect(robot).not_to have_received(:move_to)
      end
    end

    describe 'moving north' do
      let(:heading) { Heading::NORTH }
      let(:final_position) { Position.for(1, 2, Heading::NORTH) }

      include_examples 'moves correctly'
    end

    describe 'moving east' do
      let(:heading) { Heading::EAST }
      let(:final_position) { Position.for(2, 1, Heading::EAST) }

      include_examples 'moves correctly'
    end

    describe 'moving south' do
      let(:heading) { Heading::SOUTH }
      let(:final_position) { Position.for(1, 0, Heading::SOUTH) }

      include_examples 'moves correctly'
    end

    describe 'moving west' do
      let(:heading) { Heading::WEST }
      let(:final_position) { Position.for(0, 1, Heading::WEST) }

      include_examples 'moves correctly'
    end
  end
end
