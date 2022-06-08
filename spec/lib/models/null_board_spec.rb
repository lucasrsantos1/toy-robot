require 'models/null_board'

RSpec.describe NullBoard do
  subject(:board) { described_class.new }
  let(:obj) { double(x: 1, y: 1) }

  describe '#valid_position?' do
    it 'returns false' do
      expect(board.valid_position?(x: 0, y: 0)).to be false
    end
  end

  describe '#occupy' do
    it 'returns false' do
      expect(board.occupy(obj: obj, x: 1, y: 1)).to be false
    end
  end
end
