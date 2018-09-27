require './models/bookmarks'
require 'pg'

describe Bookmarks do

  describe '.add' do
    it 'adds a bookmark with title' do
      Bookmarks.add(url: 'www.goodbye.com', title: 'goodbye!')
      bookmark_title = Bookmarks.all.first.title
      expect(bookmark_title).to eq('goodbye!')
      bookmark_url = Bookmarks.all.first.url
      expect(bookmark_url).to eq('www.goodbye.com')
    end
  end
end
