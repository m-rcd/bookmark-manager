require './models/bookmark'
describe Bookmark do
  describe '.all' do
    it 'returns list of instances created' do
      a = ['https://www.goodreads.com/',
        'https://makers.tech']
      expect(Bookmark.all).to eq(a)
    end
  end
end
