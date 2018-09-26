require './models/bookmarks'
require 'pg'

describe Bookmarks do
  describe '.all' do
    it 'shows a list of bookmarks' do
      con = PG.connect :dbname => 'bookmark_manager_test'

      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      Bookmarks.add(url: 'www.hello.com')
      expect(Bookmarks.all).to include('www.hello.com')
    end
  end
end
