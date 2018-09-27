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

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmarks.add(url:'www.goodbye.com', title: 'goodbye!')
      Bookmarks.delete(id: bookmark.id)
      expect(Bookmarks.all.length).to eq 0
    end
  end

  describe '.update' do
    it "updates bookmark" do
      bookmark = Bookmarks.add(title: 'Makers', url: 'https://www.makersacademy.com')
      updated_bookmark = Bookmarks.update(id: bookmark.id, url: 'https://cooleracademy.com', title: 'Cooler Academy')

      expect(updated_bookmark).to be_a Bookmarks
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Cooler Academy'
      expect(updated_bookmark.url).to eq 'https://cooleracademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark' do
      bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      result = Bookmarks.find(id: bookmark.id)
      expect(result).to be_a Bookmarks
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
