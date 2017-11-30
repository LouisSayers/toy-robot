require 'spec_helper'

describe Position do

  describe '#==' do
    let(:position1_x) { 2 }
    let(:position1_y) { 3 }
    let(:position1_heading) { Heading::NORTH }
    let(:position1) { Position.for(position1_x, position1_y, position1_heading) }

    subject { position1 == position2 }

    context 'same x, y, heading' do
      let(:position2) { Position.for(position1_x, position1_y, position1_heading) }

      it { is_expected.to eq true }
    end

    context 'different x' do
      let(:different_x) { 99 }
      let(:position2) { Position.for(different_x, position1_y, position1_heading) }

      it { is_expected.to eq false}
    end

    context 'different y' do
      let(:different_y) { 99 }
      let(:position2) { Position.for(position1_x, different_y, position1_heading) }

      it { is_expected.to eq false}
    end

    context 'different heading' do
      let(:different_heading) { Heading::SOUTH }
      let(:position2) { Position.for(position1_x, position1_y, different_heading) }

      it { is_expected.to eq false}
    end
  end

end
