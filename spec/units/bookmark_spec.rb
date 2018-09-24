require './models/bookmark'
describe Bookmark do
  describe '.all' do
    it 'returns an array of instances' do
      a = Bookmark.new
      b = Bookmark.new
      expect(Bookmark.all).to eq([a, b])
    end
  end
end
