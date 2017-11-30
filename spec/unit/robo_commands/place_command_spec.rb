require 'spec_helper'

describe PlaceCommand do
  let(:robot) { instance_double(ToyRobot) }
  let(:grid) { instance_double(Grid) }
  let(:xPos) { 3 }
  let(:yPos) { 4 }
  let(:heading) { Heading::NORTH}

  subject { described_class.new(xPos, yPos, heading) }

  describe '#execute' do
    subject { super().execute(robot, grid) }

    before do
      allow(grid).to receive(:position_valid?) { grid_position_is_valid }
      allow(robot).to receive(:move_to)
      subject
    end

    describe 'is outside of the grid' do
      let(:grid_position_is_valid) { false }

      it 'does not move the robot' do
        expect(robot).not_to have_received(:move_to)
      end
    end

    describe 'is inside the grid' do
      let(:grid_position_is_valid) { true }
      let(:expected_position) { Position.for(xPos, yPos, heading) }

      it 'moves the robot' do
        expect(robot).to have_received(:move_to).with(expected_position)
      end
    end
  end

end
