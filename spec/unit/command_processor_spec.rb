require 'spec_helper'

describe CommandProcessor do
  let(:processor) { described_class.new }

  describe '#each' do
    let(:quit_input) { 'QUIT' }
    let(:given_block) { instance_double(Proc) }
    let(:command) { double }

    subject do
      processor.each { |command| given_block.call(command) }
    end

    before do
      allow(given_block).to receive(:call)
      allow(CommandFactory).to receive(:create_command) { command }
      allow(processor).to receive(:output)
      allow(processor).to receive(:get_input).and_return(input, quit_input)
    end

    context 'unknown command' do
      describe 'unknown command' do
        let(:input) { 'DERP' }

        it 'does nothing' do
          expect { subject }.not_to raise_error
        end
      end
    end

    context 'known command' do
      before { subject }

      describe 'beginning processing of commands' do
        let(:input) { quit_input }

        it 'prints a message to indicate accepting of commands' do
          expect(processor).to have_received(:output).with('Accepting commands:')
        end
      end

      shared_examples 'a command' do
        it 'delegates command creation' do
          expect(CommandFactory).to have_received(:create_command).with(expected_command_args)
        end

        it 'yields the command to the given block' do
          expect(given_block).to have_received(:call).with(command)
        end
      end

      describe 'PLACE command' do
        let(:input) { 'PLACE 1 3 EAST' }
        let(:expected_command_args) do
          {
            'command' => :place,
            'x' => 1,
            'y' => 3,
            'heading' => 'east'
          }
        end
        it_behaves_like 'a command'
      end

      describe 'LEFT command' do
        let(:input) { 'LEFT' }
        let(:expected_command_args) { { 'command' => :left } }
        it_behaves_like 'a command'
      end

      describe 'RIGHT command' do
        let(:input) { 'RIGHT' }
        let(:expected_command_args) { { 'command' => :right } }
        it_behaves_like 'a command'
      end

      describe 'MOVE command' do
        let(:input) { 'MOVE' }
        let(:expected_command_args) { { 'command' => :move } }
        it_behaves_like 'a command'
      end

      describe 'REPORT command' do
        let(:input) { 'REPORT' }
        let(:expected_command_args) { { 'command' => :report } }
        it_behaves_like 'a command'
      end
    end
  end

end
