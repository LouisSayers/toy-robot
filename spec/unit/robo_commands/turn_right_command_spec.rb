require 'spec_helper'

describe TurnRightCommand do

  describe '#execute' do
    let(:command) { described_class.new }
    let(:heading) { Heading.for(Heading::NORTH) }
    let(:next_heading) { Heading.for(Heading::EAST) }
    let(:position) { instance_double(Position, heading: heading) }
    let(:next_position) { instance_double(Position) }
    let(:robot) { instance_double(ToyRobot, position: position) }
    let(:grid) { instance_double(Grid) }

    subject { command.execute(robot, grid) }

    before do
      allow(heading).to receive(:next_clockwise) { next_heading }
      allow(position).to receive(:create_relative).with(nil, nil, next_heading) { next_position }
      allow(grid).to receive(:position_valid?) { grid_position_valid }
      allow(robot).to receive(:move_to)
      subject
    end

    context 'position is valid' do
      let(:grid_position_valid) { true }

      it 'moves the robot' do
        expect(robot).to have_received(:move_to).with(next_position)
      end
    end

    context 'position is invalid' do
      let(:grid_position_valid) { false }

      it 'does not move the robot' do
        expect(robot).not_to have_received(:move_to)
      end
    end
  end

end
