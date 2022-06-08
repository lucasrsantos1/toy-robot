require 'toy_robot_app'

RSpec.describe ToyRobotApp do
  describe '#call' do
    context 'when passing instructions from a file to ToyRobotApp' do
      context 'when you have one robot moving' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-1.csv') 
          end.to output("0, 1, NORTH\n").to_stdout
        end
      end
      
      context 'when you have one robot moving and changing directions' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-2.csv') 
          end.to output("0, 0, WEST\n").to_stdout
        end
      end

      context 'when you have one robot moving and colliding with the wall' do
        it 'processes the instructions' do
          expect do
            described_class.call('./data/test-data-5.csv') 
          end.to output("5, 4, EAST\n").to_stdout
        end
      end
    end
  end
end
