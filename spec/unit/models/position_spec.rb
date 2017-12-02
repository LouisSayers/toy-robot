require 'spec_helper'

describe Position do
  let(:position1_x) { 2 }
  let(:position1_y) { 3 }
  let(:position1_heading) { Heading::NORTH }
  let(:position1) { Position.for(position1_x, position1_y, position1_heading) }

  describe '#==' do
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

  describe '#to_s' do
    let(:heading_str) { 'TheHeading' }

    subject { position1.to_s }

    before do
      allow(position1.heading).to receive(:to_s) { heading_str }
    end

    it 'contains the x position' do
      expect(subject).to match(/^#{position1_x}/)
    end

    it 'contains the y position' do
      expect(subject).to match(/^\d+ #{position1_y}/)
    end

    it 'contains the heading' do
      expect(subject).to match(/^\d+ \d+ #{heading_str}/)
    end
  end

  describe '#create_relative' do
    let(:x_change) { nil }
    let(:y_change) { nil }
    let(:new_heading) { nil }

    subject { position1.create_relative(x_change, y_change, new_heading) }

    context 'no changes' do
      it 'creates a new position object even if nothing changes' do
        expect(subject).not_to equal(position1)
      end
    end

    describe 'change in x' do
      let(:x_change) { -1 }
      let(:expected_x) { position1_x + x_change }

      it 'updates x' do
        expect(subject.x).to eq expected_x
      end

      it 'does not update y' do
        expect(subject.y).to eq position1_y
      end

      it 'does not update heading' do
        expect(subject.heading).to eq Heading.for(position1_heading)
      end
    end

    describe 'change in y' do
      let(:y_change) { -1 }
      let(:expected_y) { position1_y + y_change }

      it 'does not update x' do
        expect(subject.x).to eq position1_x
      end

      it 'updates y' do
        expect(subject.y).to eq expected_y
      end

      it 'does not update heading' do
        expect(subject.heading).to eq Heading.for(position1_heading)
      end
    end

    describe 'change in heading' do
      let(:new_heading) { Heading::WEST }

      it 'does not update x' do
        expect(subject.x).to eq position1_x
      end

      it 'does not update y' do
        expect(subject.y).to eq position1_y
      end

      it 'updates heading' do
        expect(subject.heading).to eq Heading.for(new_heading)
      end
    end
  end

end
